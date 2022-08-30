import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Flutter Hooksを利用した処理を作成する
/// - Flutter HooksのuseStateを利用してカウンターアプリの状態管理を行う
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
      home: const UseStateHomePage(),
    );
  }
}

/// HooksのuseStateを利用したカウンターアプリのページ
class UseStateHomePage extends HookWidget {
  const UseStateHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ステートとして管理する情報を定義
    // NOTE: HookWidgetの中でuseState(初期値)を書くと、useStateValueNotifier<初期値の型>が返却される
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterHooksEx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              // ステートの情報を参照する
              counter.value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // FABタップ時にステートの情報を更新する
          counter.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
