import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/// path_providerを利用してファイルの読み書きを行う処理を作成する
///
/// 利用するパッケージ
/// - https://pub.dev/packages/path_provider
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // テキスト入力のコントローラーを格納
  late TextEditingController _inputTextController;

  // テキストを読み書きするローカルファイル名
  final _fileName = "text.txt";

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
      /// NOTE: キーボードを出した際、BOTTOM OVERFLOWED BY * PIXELSが発生した場合の警告を回避
      resizeToAvoidBottomInset: false,
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
              onPressed: () async {
                await _writeText(_inputTextController.text);
                setState(() {
                  _hideInputKeyBord();
                  _showSnackBar(context, 'ファイルに書き込みました');
                });
              },
              child: const Text('ファイルに書き込む'),
            ),
            // 読み込みボタンの生成
            ElevatedButton(
              onPressed: () async {
                final text = await _readText();
                setState(() {
                  _inputTextController.text = text;
                  _hideInputKeyBord();
                  _showSnackBar(context, 'ファイルから読み込みました');
                });
              },
              child: const Text('ファイルから読み込む'),
            ),
            // クリアボタン
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _inputTextController.clear();
                });
              },
              child: const Text('テキストをクリアする'),
            ),
          ],
        ),
      ),
    );
  }

  /// テキストの書き込み
  Future<void> _writeText(String contents) async {
    final file = File(await _getFilePath());
    await file.writeAsString(contents);
  }

  /// テキストの読み込み
  Future<String> _readText() async {
    final file = File(await _getFilePath());
    return await file.readAsString();
  }

  /// ファイルパスを取得する
  Future<String> _getFilePath() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/$_fileName';
  }

  /// スナックバーを表示する
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// キーボードを閉じる
  void _hideInputKeyBord() => FocusScope.of(context).unfocus();
}
