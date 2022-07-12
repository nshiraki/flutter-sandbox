import 'package:flutter/material.dart';

/// ListViewの表示
/// - 区切り線なし（ListView.builder）
/// - 区切り線あり（ListView.separated）
void main() => runApp(MyApp());

/// アイテムデータ
class ItemData {
  final String? text;
  final Color? color;

  ItemData({required this.text, required this.color}) {
    // コンストラクタ
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    // コンストラクタ
  }

  // アイテムデータ
  final List<ItemData> items = <ItemData>[
    ItemData(text: 'A', color: Colors.amber[500]),
    ItemData(text: 'B', color: Colors.amber[300]),
    ItemData(text: 'C', color: Colors.amber[100]),
    ItemData(text: 'D', color: Colors.green[500]),
    ItemData(text: 'E', color: Colors.green[300]),
    ItemData(text: 'F', color: Colors.green[100]),
    ItemData(text: 'G', color: Colors.blue[500]),
    ItemData(text: 'H', color: Colors.blue[300]),
    ItemData(text: 'I', color: Colors.blue[100]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListViewEx',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('ListViewEx'),
          ),
          // 区切り線付きのListViewを生成する
          body: createListView(items)),
    );
  }

  /// アイテムデータからListViewを生成する(区切り線なし)
  ListView createListView(List<ItemData> items) {
    // ListViewを生成する
    return ListView.builder(
      // paddingの指定
      padding: const EdgeInsets.all(8),
      // アイテム数の指定
      itemCount: items.length,
      // アイテムを表示するwidgetを生成
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return Container(
          height: 100,
          color: item.color,
          child: Center(child: Text('Entry ${item.text}')),
        );
      },
    );
  }

  /// アイテムデータからListViewを生成する(区切り線あり)
  ListView createSeparatedListView(List<ItemData> items) {
    return ListView.separated(
      // paddingの指定
      padding: const EdgeInsets.all(8),
      // アイテム数の指定
      itemCount: items.length,
      // アイテムを表示するwidgetを生成
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return Container(
          height: 100,
          color: item.color,
          child: Center(child: Text('Entry ${item.text}')),
        );
      },
      // 区切り線を生成
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
