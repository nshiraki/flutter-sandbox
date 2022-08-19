import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import 'widget_battery_level.dart';
import 'widget_device_info_list_item.dart';
import 'widget_loading_progress.dart';

/// flutter_reactive_bleを利用してBLEデバイスと通信を行う処理を作成する
///
/// - flutter_reactive_ble
///     - https://pub.dev/packages/flutter_reactive_ble
/// - BLE Peripheral Simulator（Peripheralとして利用）
///     - https://github.com/WebBluetoothCG/ble-test-peripheral-android
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Battery Service > サービスのUUID
  final Uuid serviceUuid = Uuid.parse("0000180F-0000-1000-8000-00805f9b34fb");

  // Battery Service > サービス > キャラクタリスティックのUUID
  final Uuid characteristicUuid =
      Uuid.parse("00002A19-0000-1000-8000-00805f9b34fb");

  // FlutterReactiveBle
  final _flutterReactiveBle = FlutterReactiveBle();

  // BLEのステータスを格納
  BleStatus _bleStatus = BleStatus.unknown;

  // デバイス検出のStreamSubscriptionを格納
  late StreamSubscription<DiscoveredDevice> _scanStreamSubscription;

  // 検出したデバイスを格納
  late DiscoveredDevice _foundDevice;

  // 接続状態のStreamSubscriptionを格納
  late StreamSubscription<ConnectionStateUpdate> _connStreamSubscription;

  // キャラクタリスティックを格納
  late QualifiedCharacteristic _qualifiedCharacteristic;

  // デバイス情報の表示に利用するもの
  String _deviceId = 'unknown';
  String _deviceName = 'unknown';

  // バッテリーレベル（キャラクタリスティックから取得する）
  int? _batteryLevel;

  // BLEデバイスに接続しているかどうか
  bool _deviceConnected = false;

  // ローディングの表示切替
  bool _isLoading = false;

  /// 再描画させる
  void refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReactiveBleEx'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                // BLE通信の利用可能状態（ready以外の場合は利用不可）
                StreamBuilder(
                    stream: _flutterReactiveBle.statusStream,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<BleStatus> snapshot,
                    ) {
                      if (snapshot.hasData) {
                        // BLEの通信利用可能状態を格納
                        _bleStatus = snapshot.data ?? BleStatus.unknown;
                        return DeviceInfoListItem(
                            title: 'BLE Status', subTitle: _bleStatus.name);
                      }
                      return const DeviceInfoListItem(
                          title: 'BLE Status Check');
                    }),
                // デバイスID
                DeviceInfoListItem(title: 'Device Id', subTitle: _deviceId),
                // デバイス名
                DeviceInfoListItem(title: 'Device Name', subTitle: _deviceName),
                // 接続状態
                DeviceInfoListItem(
                    title: 'Device Connected', subTitle: _deviceConnected),
                // キャラクタリスティック
                DeviceInfoListItem(
                    title: 'Characteristic',
                    subTitle: _batteryLevel ?? 'unknown'),
                // バッテリーレベルの表示
                Container(
                    padding: const EdgeInsets.only(top: 32, bottom: 32),
                    child: BatteryLevel(
                      value: _batteryLevel,
                    )),

                // ボタンのグループ
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 接続ボタン
                    ElevatedButton(
                      onPressed: _deviceConnected ? null : _scanDevice,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'CONNECT',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    // 切断ボタン
                    ElevatedButton(
                      onPressed: _deviceConnected ? _disconnect : null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'DISCONNECT',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ローディングの表示
          LoadingProgress(visible: _isLoading),
        ],
      ),
    );
  }

  /// BLEデバイスを検出する
  void _scanDevice() {
    _isLoading = true;
    refreshScreen();

    // デバイスを検索する
    final scanStream =
        _flutterReactiveBle.scanForDevices(withServices: [serviceUuid]);
    _scanStreamSubscription = scanStream.listen((device) {
      // NOTE: 検出したBLEデバイスはBattery Serviceとみなして処理を行う
      _foundDevice = device;

      // BLEデバイスに接続する
      connectToDevice();
    });
  }

  /// 検出したBLEデバイスに接続する
  void connectToDevice() async {
    // デバイスの検索を停止
    await _scanStreamSubscription.cancel();

    // デバイス接続を行い、Streamを取得する
    final connStream = _flutterReactiveBle.connectToAdvertisingDevice(
      id: _foundDevice.id,
      withServices: [serviceUuid],
      prescanDuration: const Duration(seconds: 5),
      servicesWithCharacteristicsToDiscover: {
        serviceUuid: [characteristicUuid]
      },
      connectionTimeout: const Duration(seconds: 2),
    );

    // デバイス接続状態を監視
    _connStreamSubscription = connStream.listen(
      (ConnectionStateUpdate event) {
        // 返却された接続状態をハンドリング
        handleConnectionStateUpdate(event);
      },
      onDone: () {
        _isLoading = false;
        refreshScreen();
      },
    );
  }

  /// デバイスを切断する
  _disconnect() async {
    await _connStreamSubscription.cancel();
    // 接続状態を更新
    _deviceConnected = false;
    // デバイス情報をクリア
    _deviceId = 'unknown';
    _deviceName = 'unknown';
    _batteryLevel = null;
    refreshScreen();
  }

  /// デバイスの接続状態をハンドリングする処理
  Future<void> handleConnectionStateUpdate(ConnectionStateUpdate event) async {
    final state = event.connectionState;

    print('** ConnectionStateUpdate= $state **');

    if (state == DeviceConnectionState.connecting) {
      _isLoading = true;
      refreshScreen();
    } else if (state == DeviceConnectionState.connected) {
      _isLoading = false;
      refreshScreen();

      // 接続状態を更新
      _deviceConnected = true;
      // デバイス情報を更新
      _deviceId = _foundDevice.id;
      _deviceName = _foundDevice.name;
      refreshScreen();

      // キャラクタリスティックを取得
      _qualifiedCharacteristic = QualifiedCharacteristic(
        serviceId: serviceUuid,
        characteristicId: characteristicUuid,
        deviceId: _foundDevice.id,
      );

      // キャラクタリスティックの値を読み込む
      final data = await _flutterReactiveBle
          .readCharacteristic(_qualifiedCharacteristic);
      _batteryLevel = data.first;
      refreshScreen();

      // キャラクタリスティックの変更通知を購読
      _flutterReactiveBle
          .subscribeToCharacteristic(_qualifiedCharacteristic)
          .listen((data) {
        _batteryLevel = data.first;
        refreshScreen();
      });
    } else if (state == DeviceConnectionState.disconnecting) {
      _isLoading = true;
      refreshScreen();
    } else if (state == DeviceConnectionState.disconnected) {
      _isLoading = false;
      refreshScreen();
    }
  }
}
