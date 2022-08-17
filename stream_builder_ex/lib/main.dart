import 'package:flutter/material.dart';

/// StreamBuilderを利用して、Streamの値に応じてWidgetを更新する処理を作成する
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

  /// StreamBuilderで監視するStreamの定義
  Stream<int> _countStream() async* {
    // 一秒おきに数値を返却
    for (var i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _countStream();

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilderEx'),
      ),
      body: Center(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline5!,

          child: StreamBuilder(
            stream: data,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Text('Count: ${snapshot.data}');
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
