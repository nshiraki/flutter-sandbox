import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// アセット画像をCustomPainterで描画する
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ImageGraphicsEx'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ui.Image? _image;

  /// アセットから画像を読み込む
  Future<ui.Image> loadImageAsset(String assetName) async {
    final byteData = await rootBundle.load(assetName);
    return decodeImageFromList(byteData.buffer.asUint8List());
  }

  @override
  void initState() {
    super.initState();
    loadImageAsset('images/vacation_drive.png').then((image) => {
          setState(() {
            _image = image;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: ImagePainter(_image));
  }
}

/// 画像表示用のCustomPainter
class ImagePainter extends CustomPainter {
  // 表示する画像を格納
  final ui.Image? _image;

  // コンストラクタ
  ImagePainter(this._image);

  @override
  void paint(Canvas canvas, Size size) {
    // キャンバスに画像を描画する
    if (_image != null) {
      final paint = Paint();
      const offset = Offset(0, 0);
      canvas.drawImage(_image!, offset, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
