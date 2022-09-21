import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// flutter_ttsを利用して、Text to Speech（テキスト読み上げ）を行う処理を作成する
///
/// 利用パッケージ
/// - https://pub.dev/packages/flutter_tts
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

/// テキストスピーチの状態
enum SpeechStatus {
  speaking(comment: '発話中'),
  completion(comment: '発話完了'),
  unknown(comment: '無効値');

  const SpeechStatus({required this.comment});

  final String comment;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FlutterTts flutterTts;

  // テキスト入力のコントローラーを格納
  late TextEditingController _inputTextController;

  // 読み上げの状態
  SpeechStatus speechStatus = SpeechStatus.unknown;

  // 読み上げるテキストの初期値
  String speakText = """
  今日も、新幹線をご利用くださいまして、
  ありがとうございます。
  この電車は、のぞみ号、博多行きです。

  途中の停車駅は、
  新横浜、名古屋、京都、
  新大阪、新神戸、岡山、
  広島、新山口、小倉です。

  続いて、車内のご案内をいたします。
  自由席は、1号車、2号車、3号車です。
  この電車は、全席、禁煙となっております。
  お煙草を吸われるお客様は、喫煙ルームをご利用ください。
  普通車の喫煙ルームは、3号車、7号車、15号車、
  グリーン車の喫煙ルームは、10号車にあります。
  車掌室は、8号車です。この電車では、東京から新大阪間で無線LANによる、
  インターネット接続サービスがご利用になれます。
  携帯電話は、マナーモードに切り替えるなど、周りのお客様のご迷惑とならないように、
  ご協力をお願いいたします。
  """
      .replaceAll(' ', '');

  @override
  void initState() {
    super.initState();
    initTts();
    _inputTextController = TextEditingController(text: speakText);
  }

  @override
  void dispose() {
    _inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextToSpeechEx'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 読み上げるテキストの入力フィールド
            TextField(
              minLines: 10,
              maxLines: 10,
              controller: _inputTextController,
              decoration: const InputDecoration(
                hintText: 'ここに読み上げたいテキストを入力してください。',
                border: OutlineInputBorder(),
              ),
            ),
            // 余白
            const SizedBox(height: 16),
            // ステータス表示
            Text(
              "Status: ${speechStatus.name}",
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
          ],
        ),
      ),
      // 読み上げを開始するボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 発話中なら早期リターン
          if (speechStatus == SpeechStatus.speaking) {
            return;
          }

          _speak();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  /// テキストスピーチの初期化
  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    // 読み上げ開始時のハンドリング
    flutterTts.setStartHandler(() {
      setState(() {
        speechStatus = SpeechStatus.speaking;
      });
    });

    // 読み上げ完了時のハンドリング
    flutterTts.setCompletionHandler(() {
      setState(() {
        speechStatus = SpeechStatus.completion;
      });
    });
  }

  /// テキストを読み上げる
  Future _speak() async {
    // 言語、音量、ピッチ、スピーチレートの設定
    await flutterTts.setLanguage("ja-JP");
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.8);

    // 発話させる
    await flutterTts.speak(_inputTextController.text);
  }

  /// 読み上げ完了の通知を有効にする設定
  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }
}
