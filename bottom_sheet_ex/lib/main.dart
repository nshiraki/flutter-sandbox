import 'package:flutter/material.dart';

/// BottomSheetを利用した処理を作成する
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
      home: const MyHomePage(title: 'BottomSheetEx'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// 選択アイテムのenum定数
enum Item { none, item1, item2, item3 }

class _MyHomePageState extends State<MyHomePage> {
  var _selectedItem = Item.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 選択中のアイテムの表示
            Text(
              'Item: ${_selectedItem.name}',
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
            ),
            // 余白
            const SizedBox(height: 16.0),
            // アイテム選択を表示するボタン
            ElevatedButton(
              onPressed: () => _showItemSelectorBottomSheet(),
              child: const Text(
                'Show Item Selector',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  // アイテム選択のBottomSheetを表示
  _showItemSelectorBottomSheet() async {
    var result = await showModalBottomSheet<Item>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.android),
              title: Text(Item.item1.name),
              onTap: () => Navigator.of(context).pop(Item.item1),
            ),
            ListTile(
              leading: const Icon(Icons.android),
              title: Text(Item.item2.name),
              onTap: () => Navigator.of(context).pop(Item.item2),
            ),
            ListTile(
              leading: const Icon(Icons.android),
              title: Text(Item.item3.name),
              onTap: () => Navigator.of(context).pop(Item.item3),
            ),
          ],
        );
      },
    );
    // 結果を更新
    setState(() => _selectedItem = result ?? _selectedItem);
  }
}
