import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Googleマップを表示する処理を作成する
/// 利用パッケージ
/// - https://pub.dev/packages/google_maps_flutter
///
/// ビルドする場合は、Google Maps PlatformからGoogle Maps用のAPIキーを取得して、
/// AndroidManifestファイルにAPIキーを設定してください
/// - https://mapsplatform.google.com/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // GoogleMapControllerを格納
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoogleMapsEx'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // Googleマップを生成
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                initialCameraPosition: _getInitialCameraPosition(),
              ),
            ),
            // 表示位置（カメラ位置）を変更するボタンを生成
            Wrap(
              children: [
                _buildButton(
                    displayText: '新宿',
                    latLng: const LatLng(35.693825, 139.703356)),
                _buildButton(
                    displayText: '渋谷',
                    latLng: const LatLng(35.6580339, 139.7016358)),
                _buildButton(
                    displayText: '品川',
                    latLng: const LatLng(35.628471, 139.73876)),
                _buildButton(
                    displayText: '東京',
                    latLng: const LatLng(35.6809591, 139.7673068)),
                _buildButton(
                    displayText: '上野',
                    latLng: const LatLng(35.713612, 139.77703)),
                _buildButton(
                    displayText: '池袋',
                    latLng: const LatLng(35.729503, 139.7109)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// GoogleMap生成時に呼ばれる
  /// [controller]onMapCreatedから返却された、GoogleMapController
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  /// カメラの初期表示位置を返却
  /// [return]初期表示位置のCameraPosition
  CameraPosition _getInitialCameraPosition() {
    return const CameraPosition(
      // 初期表示位置を東京にする
      target: LatLng(35.6809591, 139.7673068),
      zoom: 17.0,
    );
  }

  /// 表示位置（カメラ位置）を変更するボタンを生成する
  /// [displayText]表示テキスト
  /// [latLng]表示位置（カメラ位置）となる緯度経度
  /// [return]ElevatedButton
  Widget _buildButton({
    required String displayText,
    required LatLng latLng,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
          onPressed: () => {_updateCameraPosition(latLng: latLng)},
          child: Text(displayText)),
    );
  }

  /// 表示位置（カメラ位置）を変更する
  /// [latLng]表示位置（カメラ位置）となる緯度経度
  void _updateCameraPosition({required LatLng latLng}) {
    setState(() {
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 17.0,
          ),
        ),
      );
    });
  }
}
