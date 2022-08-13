import 'package:flutter/material.dart';

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
  // テキスト入力のコントローラーを格納
  late TextEditingController _inputTextController;

  @override
  void initState() {
    super.initState();
    _inputTextController = TextEditingController();
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
        title: const Text('FileEx'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // テキストフィールドの生成
            TextField(
              minLines: 10,
              maxLines: 10,
              controller: _inputTextController,
              decoration: const InputDecoration(
                hintText: 'ファイルに読み書きするテキストを入力',
                border: OutlineInputBorder(),
              ),
            ),
            // 書き込みボタンの生成
            ElevatedButton(
              onPressed: () {
                // TODO: 書き込み処理を行う
              },
              child: const Text('ファイルに書き込む'),
            ),
            // 読み込みボタンの生成
            ElevatedButton(
              onPressed: () {
                // TODO: 読み込み処理を行う
              },
              child: const Text('ファイルから読み込む'),
            ),
          ],
        ),
      ),
    );
  }
}
