import 'package:flutter/material.dart';

import 'first_page.dart';

void main() => runApp(const MyApp());

/// 画面遷移
/// 入力したテキストを次の画面に渡して表示する
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screen Transition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
