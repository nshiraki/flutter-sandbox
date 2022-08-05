import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// SingleChildScrollViewを利用してスクロールする処理を作成
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ScrollViewEx'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            // 水平スクロールの場合は、Axis.horizontalを指定
            scrollDirection: Axis.vertical,
            // 水平スクロールの場合は、Rowを指定
            child: Column(
              children: [
                // スクロールさせるアイテムを追加
                for (var i = 0; i < 20; i++)
                  _buildScrollItem(text: 'Item ${i + 1}')
              ],
            ),
          ),
        ));
  }

  // スクロールさせるアイテムを生成
  Widget _buildScrollItem({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // 角丸、背景、枠線を装飾したコンテナを作成
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          width: 240,
          height: 240,
          child: Center(
              child: Text(text,
                  style: const TextStyle(color: Colors.blue, fontSize: 24)))),
    );
  }
}
