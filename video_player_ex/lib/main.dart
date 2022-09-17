import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// video_playerパッケージを利用して動画を再生する処理を作成する
///
/// パッケージ
/// - https://pub.dev/packages/video_player
/// 公式のクックブック
/// - https://docs.flutter.dev/cookbook/plugins/play-video
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
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // コントローラーを初期化
    _controller = VideoPlayerController.asset('assets/butterfly.mp4');
    // FutureBuilderで利用する非同期処理を格納しておく
    _initializeVideoPlayerFuture = _controller.initialize();
    // ループ再生を有効にする
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoPlayerEx'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // 初期化完了後、アスペクト比を補正したVideoPlayerを返却する
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // 初期化中の場合は、プログレスを表示
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // タップしたらコントローラーの再生状態を更新する
          setState(() {
            if (_controller.value.isPlaying) {
              // 再生中なら一時停止
              _controller.pause();
            } else {
              // 一時停止なら再生
              _controller.play();
            }
          });
        },
        // コントローラーの再生状態に応じて、FABボタンのアイコンを設定
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
