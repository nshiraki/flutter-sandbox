import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// キー入力のイベントをハンドリングしてテキストで表示する
/// 低レベルのキー入力を取得する場合は、RawKeyboardListenerウィジェットを使う。
/// RawKeyboardListenerの引数の child: のウィジェットにフォーカスが当たるとリスナーが機能するようになっている。
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  final _focusNode = FocusNode();
  late String _inputText;

  @override
  void initState() {
    super.initState();
    // キーの情報を初期化
    _inputText = _getInputText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('KeyEventEx'),
        ),
        body: RawKeyboardListener(
            focusNode: _focusNode,
            onKey: _handleKeyEvent,
            child: Center(
              child: Text(
                _inputText,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            )));
  }

  // キーイベントのハンドル処理
  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      // イベントからキーの情報を取得
      _inputText = _getInputText(event);
    });
  }

  // RawKeyEventからキー情報のテキストを取得する
  String _getInputText([RawKeyEvent? event]) {
    final StringBuffer sb = StringBuffer();

    if (event == null) {
      // イベントがない場合は早期リターン
      sb.writeln("debugName: ---");
      sb.writeln("keyLabel: ---");
      sb.writeln("keyId: ---");
      sb.writeln("keyTrigger: ---");
      return sb.toString();
    }

    // 入力されたキーの名前とキーのIDを取得
    sb.writeln("debugName:  ${event.logicalKey.debugName}");
    sb.writeln("keyLabel:  ${event.logicalKey.keyLabel}");
    sb.writeln("keyId:  ${event.logicalKey.keyId}");

    // 入力されたキーのトリガー情報（ダウンイベント、アップイベント）を取得
    if (event is RawKeyDownEvent) {
      sb.writeln("keyTrigger: Down");
    } else if (event is RawKeyUpEvent) {
      sb.writeln("keyTrigger: Up");
    }
    return sb.toString();
  }
}
