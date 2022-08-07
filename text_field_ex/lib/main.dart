import 'package:flutter/material.dart';

/// TextFieldを利用したテキスト入力の処理を作成する
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
      home: const MyHomePage(title: 'TextFieldEx'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // テキスト入力のコントローラーを格納
  late TextEditingController _controller;

  // 入力したメッセージを格納
  var _inputMessage = '';

  @override
  void initState() {
    super.initState();
    // テキスト入力のコントローラーを取得
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // テキスト入力のコントローラーを破棄
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
          child: Column(
            children: <Widget>[
              // メッセージを入力するフィールド
              TextField(
                autofocus: true,
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'メッセージを入力',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    _inputMessage = _controller.text;
                  });
                },
              ),
              // 余白
              const SizedBox(height: 16.0),
              // ラベル表示
              const SizedBox(
                width: double.infinity,
                child: Text(
                  '入力中のメッセージ',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  textAlign: TextAlign.left,
                ),
              ),
              // 余白
              const SizedBox(height: 8.0),
              // 入力中のメッセージを表示
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 48,
                // ボーダーで下線を描く
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  _inputMessage,
                  style: const TextStyle(color: Colors.grey, fontSize: 24),
                ),
              ),
              // 余白
              const SizedBox(height: 16.0),
              // 入力したメッセージを表示するボタン
              ElevatedButton(
                  onPressed: _showAlertDialog,
                  child: const Text('Show Input Message'))
            ],
          ),
        ));
  }

  // 入力したメッセージを表示するダイアログ
  Future<void> _showAlertDialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Input Message'),
          // コントローラーで保持しているテキストを表示
          content: Text(_controller.text),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                // ダイアログを閉じる
                Navigator.pop(context, 'OK');
              },
            ),
          ],
        );
      },
    );
  }
}
