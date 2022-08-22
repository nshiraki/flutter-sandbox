import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_gallery_saver/image_gallery_saver.dart';

/// cameraパッケージを利用して、カメラ機能を利用した処理を作成する
/// - やってること
///     - カメラの起動
///     - 利用可能なカメラの取得
///     - カメラのプレビュー表示
///     - 写真を撮る
///     - 撮影した写真を表示
///     - 写真をギャラリーへ保存
void main() async {
  // runApp()を呼び出す前にFlutter Engineの機能を利用できるようにする
  WidgetsFlutterBinding.ensureInitialized();
  // 利用可能なカメラを取得する
  var cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TakePictureScreen(camera: camera),
    );
  }
}

/// カメラのプレビュー表示、写真を撮影する画面
/// [camera]利用可能なカメラ
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  // コントローラーを格納
  late CameraController _controller;

  // コントローラーの初期化処理を格納
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // カメラのコントローラーを生成
    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を指定
      ResolutionPreset.medium,
    );

    // カメラのコントローラー初期化
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() async {
    // カメラのコントローラーを破棄する
    await _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CameraEx'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // カメラの初期化が完了したらカメラのプレビューを表示する
            return CameraPreview(_controller);
          } else {
            // カメラの初期化が完了するまでプログレスを表示する
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // 撮影ボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // カメラが初期化されていることを確認する
          await _initializeControllerFuture;

          // 写真を撮影する
          final image = await _controller.takePicture();

          // 撮影した写真の画像を表示する
          if (!mounted) return;
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(
                imagePath: image.path,
              ),
            ),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

/// カメラで撮影した画像を表示するページ
/// [imagePath]カメラで撮影した画像のファイルの保存先
class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  /// プログレス表示の有無
  var _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Stack(
        children: [
          Column(
            children: [
              // プレビュー画像
              Image.file(File(widget.imagePath)),
              // 保存ボタン
              ElevatedButton(
                onPressed: () => _saveImageToGallery(widget.imagePath),
                child: const Text('保存する'),
              )
            ],
          ),
          // プログレス表示
          Visibility(
            visible: _loading,
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  /// 撮影した画像をギャラリーに保存する
  /// [imagePath]撮影した画像のパス
  void _saveImageToGallery(String imagePath) async {
    setState(() => _loading = true);

    // キャプチャ画像をImageライブラリの形式に変換する
    final img.Image? capturedImage =
        img.decodeImage(await File(widget.imagePath).readAsBytes());

    // 画像の向きのexif情報がある場合、表示中のキャプチャ画像と方向が一致するように補正する
    if (capturedImage != null) {
      print('**** 画像の向きを補正中');
      final img.Image orientedImage = img.bakeOrientation(capturedImage);
      await File(widget.imagePath).writeAsBytes(img.encodeJpg(orientedImage));
    }
    // キャプチャ画像をギャラリーに保存する
    await ImageGallerySaver.saveImage(
        await File(widget.imagePath).readAsBytes());
    print('**** 画像を保存しました');

    setState(() => _loading = false);
  }
}
