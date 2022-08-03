import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// WebViewを利用した処理を作成する
/// WebViewを配置
/// - 起動時は'https://flutter.dev/'を表示
/// - WebView起動時にコントローラーを取得する
/// - 読み込み開始と読み込み終了のログ出力を追加してコールバックの挙動を確認する
///     - ログ出力はFlutterDevToolsで確認
/// AppBarメニューの配置
/// - WebViewから取得したコントローラーを利用してWebViewを制御する
///     - 前のページに戻る
///     - 現在のページを再読み込みする
///     - 指定のURLを読み込む（URLはビルド時に引数で指定しておく）
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
  // WebViewControllerを格納
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('WebViewEx'),
          // AppBarアクションを追加
          actions: buildAppBarActions(loadUrl: 'https://www.google.com'),
        ),
        // WebViewを追加
        body: buildWebView());
  }

  // WebViewをビルド
  WebView buildWebView() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://flutter.dev/',
      onWebViewCreated: (controller) {
        // コントローラーを取得
        _controller = controller;
      },
      onPageStarted: (url) {
        // 読み込み開始
        print('onPageStarted: $url');
      },
      onPageFinished: (url) {
        // 読み込み終了
        print('onPageStarted: $url');
      },
    );
  }

  // AppBarのアクションをビルド
  List<Widget> buildAppBarActions({required String loadUrl}) {
    return [
      // 前のページに戻るボタン
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () async {
          if (await _controller.canGoBack()) {
            // 前のページに戻る
            _controller.goBack();
          }
        },
      ),
      // 指定したUrlを読み込む
      IconButton(
        onPressed: () async {
          _controller.loadUrl(loadUrl);
        },
        icon: const Icon(Icons.book),
      ),
      // 現在のページをリロードする
      IconButton(
        onPressed: () {
          _controller.reload();
        },
        icon: const Icon(Icons.refresh),
      ),
    ];
  }
}
