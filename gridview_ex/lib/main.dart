import 'package:flutter/material.dart';

/// GridViewを利用した処理を作成する
/// - GridViewの構築はGridView.builder()を使用している
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
  // ダミーのアイテムを生成
  final List<String> _itemList = List.generate(1000, (index) {
    return 'Item ${index + 1}';
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridViewEx'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // 子Widgetのアスペクト比(w/h)
            childAspectRatio: 5 / 4,
            // Widget間の左右のスペース
            crossAxisSpacing: 4,
            // Widget間の上下のスペース
            mainAxisSpacing: 4,
            // 1列で表示するアイテム数
            crossAxisCount: 2,
          ),
          // アイテムの要素数
          itemCount: _itemList.length,
          // リストアイテムを生成
          itemBuilder: (BuildContext context, int index) {
            final item = _itemList[index];

            return Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey,
              child: Text(
                item,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            );
          },
        ),
      ),
    );
  }
}
