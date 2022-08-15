import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

/// app_settingsを利用してアプリから設定画面を表示する処理を作成する
/// 利用するパッケージ
/// - https://pub.dev/packages/app_settings
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ItemData> items = createListItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppSettingsEx'),
      ),
      body: Center(
        /// リストを生成
        child: ListView.separated(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final ItemData item = items[index];

            // リストアイテムを生成
            return ListTile(
              title: Text(item.displayText),
              onTap: () {
                item.clickAction.call();
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }

  /// アイテムデータのリストを生成
  List<ItemData> createListItems() => [
        const ItemData(
          displayText: 'アプリ設定',
          clickAction: AppSettings.openAppSettings,
        ),
        const ItemData(
          displayText: 'WIFI設定',
          clickAction: AppSettings.openWIFISettings,
        ),
        const ItemData(
          displayText: '現在地設定',
          clickAction: AppSettings.openLocationSettings,
        ),
        const ItemData(
          displayText: 'セキュリティ設定',
          clickAction: AppSettings.openSecuritySettings,
        ),
        const ItemData(
          displayText: 'Bluetooth設定',
          clickAction: AppSettings.openBluetoothSettings,
        ),
        const ItemData(
          displayText: 'データローミング設定',
          clickAction: AppSettings.openDataRoamingSettings,
        ),
        const ItemData(
          displayText: '日付設定',
          clickAction: AppSettings.openDateSettings,
        ),
        const ItemData(
          displayText: 'ディスプレイ設定',
          clickAction: AppSettings.openDisplaySettings,
        ),
        const ItemData(
          displayText: '通知設定',
          clickAction: AppSettings.openNotificationSettings,
        ),
        const ItemData(
          displayText: 'サウンド設定',
          clickAction: AppSettings.openSoundSettings,
        ),
        const ItemData(
          displayText: '内部ストレージ設定',
          clickAction: AppSettings.openInternalStorageSettings,
        ),
        const ItemData(
          displayText: 'バッテリー設定',
          clickAction: AppSettings.openBatteryOptimizationSettings,
        ),
      ];
}

/// リストで扱うアイテムデータ
@immutable
class ItemData {
  /// 表示テキスト
  final String displayText;

  /// クリック時のアクション
  final Future<void> Function({bool asAnotherTask}) clickAction;

  const ItemData({required this.displayText, required this.clickAction});
}
