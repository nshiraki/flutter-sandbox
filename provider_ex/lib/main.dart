import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// providerを利用して状態を管理する処理を作成する
/// - provider: https://pub.dev/packages/provider
///
/// 大まかな手順
/// - 管理する状態のプロバイダーを作成する
///     - クラス名 with ChangeNotifier
/// - プロバイダーのツリーを構築する
///     - MultiProvider
///     - ChangeNotifierProvider
/// - プロバイダーの取得
///     - Provider.of<T>
/// - プロバイダーを介して管理している値の取得、または更新を行う
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // プロバイダーのツリーを構築する
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterProvider>(
              create: (context) => CounterProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ));
  }
}

// カウンターの状態を管理するプロバイダー
class CounterProvider with ChangeNotifier {
  // 管理する状態
  int counter = 0;

  // カウンターを加算する
  void incrementCounter() {
    counter++;
    // 画面再描画の通知を送る
    notifyListeners();
  }

  // カウンターをリセットする
  void resetCounter() {
    counter = 0;
    // 画面再描画の通知を送る
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  // コンストラクタ
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // プロバイダーを取得
    final CounterProvider countProvider =
        Provider.of<CounterProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProviderEx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ラベル
            const Text(
              'You have pushed the button this many times:',
            ),
            Column(
              children: [
                // カウンター値を表示するテキスト
                Text(
                  countProvider.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                // 余白
                const SizedBox(height: 32),
                // カウンターをリセットするボタン
                ElevatedButton(
                    onPressed: () => countProvider.resetCounter(),
                    child: const Text('reset Count'))
              ],
            ),
          ],
        ),
      ),
      // カウンターを加算するFAB
      floatingActionButton: FloatingActionButton(
        // ボタンが押されたときに、プロバイダーのカウントアップの処理を呼んでカウント値の状態を更新する
        onPressed: countProvider.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
