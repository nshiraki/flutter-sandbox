import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

/// just_audioを利用して音楽を再生する処理を作成する
/// パッケージ
/// - https://pub.dev/packages/just_audio
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
  // AudioPlayerを格納
  final _player = AudioPlayer();

  // プレイヤーの状態を格納
  ProcessingState? _processingState;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 24, color: Colors.orange, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('JustAudioEx'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // プレイヤーの状態
            const Text(
              '**PlaybackEventStream**',
              style: textStyle,
            ),
            const SizedBox(height: 8),
            Text(
              'ProcessingState: ${_processingState?.name ?? 'not yet initialized'}',
              style: textStyle,
            ),
            const SizedBox(height: 16),
            // ボタン表示（初期化中、再生、一時停止、リプレイ）
            Builder(
              builder: (BuildContext context) {
                // ローディング中かバッファリング中の場合
                if (_processingState == ProcessingState.loading ||
                    _processingState == ProcessingState.buffering) {
                  return const CircularProgressIndicator();
                }

                // 演奏を完了した場合
                if (_processingState == ProcessingState.completed) {
                  return ElevatedButton(
                    child: const Icon(Icons.replay),
                    onPressed: () => _player.seek(Duration.zero),
                  );
                }

                // 再生中または一時停止
                if (_player.playing) {
                  // 再生中の場合
                  return ElevatedButton(
                    child: const Icon(Icons.pause),
                    onPressed: () async {
                      await _player.pause();
                    },
                  );
                } else {
                  // 一時停止中の場合
                  return ElevatedButton(
                    child: const Icon(Icons.play_arrow),
                    onPressed: () async {
                      await _player.play();
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // プレイヤーの初期化
    _init();
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  /// プレイヤーの初期化処理を行う
  Future<void> _init() async {
    print('** _init() **');

    // 再生する音楽ファイルの種類に合わせて、AudioPlayerを最適化する
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    print('** init PlaybackEventStream **');
    // プレイヤーの状態をStreamで取得
    _player.playbackEventStream.listen((state) async {
      _processingState = state.processingState;
      print('**** ProcessingState: $state');
      setState(() {});
    });

    // assetsから音楽ファイルを読み込む
    await _loadAudioFromAssets();
    // ループ再生のモードを設定
    await _player.setLoopMode(LoopMode.off);
    // 再生スピードを設定
    await _player.setSpeed(1.0);

    // シーク位置を設定
    await _player.seek(Duration.zero);
    // 音楽を再生する
    // NOTE: コメントアウト
    // await _player.play();
  }

  /// assetsから音楽ファイルを読み込む
  Future<void> _loadAudioFromAssets() async {
    print('** _loadAudioFromAssets() **');
    try {
      await _player.setAsset('assets/bgm/128_BPM124.mp3');
    } catch (e) {
      print("Failed to load bgm from assets: $e");
    }
  }
}
