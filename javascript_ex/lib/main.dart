import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// ローカルのHTMLを読み込み、JavaScriptを実行する処理
/// - 起動時にassetsからhtmlを読み込んでWebViewに表示
/// - アプリ側のボタンタップ
///     - htmlのJavaScriptを実行してhtmlのテキストをカウントアップさせる
/// - html側のボタンタップ
///     - html側で保持しているカウント数をJavaScriptを介してアプリ側へ送信
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // WebViewコントローラーを格納
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JavaScriptEx'),
      ),
      body: WebView(
        onWebViewCreated: (WebViewController webViewController) async {
          // WebViewコントローラーを取得
          _controller = webViewController;
          // ローカルのhtmlファイルを読み込む
          await _loadHtmlFromAssets();
        },
        // javaScriptを有効化する
        javascriptMode: JavascriptMode.unrestricted,
        // Flutterへデータを送信
        javascriptChannels: {
          JavascriptChannel(
            name: 'flutterApp', // JavaScript側から参照するオブジェクト名
            onMessageReceived: (result) async {
              // JavaScriptから受け取ったデータを表示
              _showAlertDialog(
                  'Received message from JavaScript', result.message);
            },
          )
        },
      ),
      // htmlのテキストをカウントアップするボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementHtmlCounter,
        child: const Icon(Icons.add),
      ),
    );
  }

  /// htmlのテキストをカウントアップする処理
  void _incrementHtmlCounter() {
    // JavaScriptのメソッドを呼び出す
    _controller.runJavascript("incrementCounter();");
  }

  // htmlファイルを読み込む処理
  Future _loadHtmlFromAssets() async {
    final html = await rootBundle.loadString('assets/test.html');

    // 読み込んだhtmlをData URIに変換する
    final fileUrl = Uri.dataFromString(html,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();

    // Data URIに変換したhtmlを読み込む
    _controller.loadUrl(fileUrl);
  }

  // JavaScript側から受け取ったメッセージを表示するダイアログ
  Future<void> _showAlertDialog(String title, String message) async {
    showDialog(
      context: context,
      builder: (_) {
        const textStyle = TextStyle(fontSize: 24);
        return AlertDialog(
          title: Text(title, style: textStyle),
          content: Text(message, style: textStyle),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                // ダイアログを閉じて結果を返却する
                Navigator.pop(context, 'OK');
              },
            ),
          ],
        );
      },
    );
  }
}
