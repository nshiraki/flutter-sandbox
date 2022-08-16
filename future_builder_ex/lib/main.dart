import 'package:flutter/material.dart';

/// FutureBuilderを利用して、非同期処理でWidgetを出し分ける処理を作成する
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilderEx'),
      ),
      body: Center(
        // 表示テキストのスタイルを指定
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline5!,
          // 非同期処理でWidgetを出し分ける
          child: FutureBuilder(
            future: _fetchData(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              // futureに指定した処理でデータの取得に成功した場合
              if (snapshot.hasData) {
                // 取得したデータを表示
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 48,
                    ),
                    Text('${snapshot.data},')
                  ],
                );
              }

              // futureに指定した処理でデータの取得に失敗した場合
              if (snapshot.hasError) {
                // エラー表示を行う
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.error_outline_outlined,
                      color: Colors.red,
                      size: 48,
                    ),
                    Text('データの取得に失敗'),
                  ],
                );
              }

              // データを取得中の場合は、プログレスを表示する
              // NOTE: 取得中の状態はConnectionStateでも判定することができる
              // snapshot.connectionState != ConnectionState.done
              // または
              // snapshot.connectionState == ConnectionState.waiting
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  /// データを取得する非同期処理
  Future<String> _fetchData() async {
    // 少し遅延させて文字列のデータを返却
    // NOTE: 第2引数は遅延後に行う処理
    return Future.delayed(const Duration(seconds: 3), () => 'データの取得に成功');
  }
}
