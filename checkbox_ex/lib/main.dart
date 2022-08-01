import 'package:flutter/material.dart';

/// チェックボックスを利用した処理を作成する
/// - チェックリスト項目を縦に複数個並べて配置
/// - チェックリストを表示するボタンを配置
///     - ボタンをタップするとチェック項目の内容をテキストで表示する
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
  // チェックリストの項目の値を格納
  final List<bool> _checkItems = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckboxEx'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          // チェックアイテムのWidgetを生成
          for (int i = 0; i < _checkItems.length; i++)
            _buildCheckBoxListTile(i),
          // チェックリスト表示ボタン
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () {
                  _showCheckListDialog();
                },
                child: const Text('Show CheckList')),
          ),
        ]),
      ),
    );
  }

  /// チェックアイテムのWidgetを生成する
  Widget _buildCheckBoxListTile(int index) {
    String itemName = 'CheckItem${index + 1}';

    // CheckboxListTileでチェック項目を作成
    return Center(
      child: SizedBox(
        width: 360,
        height: 64,
        child: CheckboxListTile(
            title: Text('$itemNameのタイトル'),
            subtitle: Text('$itemNameのサブタイトル'),
            value: _checkItems[index],
            // セカンダリにアイコンを配置する
            secondary: Icon(
              Icons.android,
              color: _checkItems[index] ? Colors.lightGreen : Colors.grey,
            ),
            // NOTE: チェックボックスの位置について
            // - ListTileControlAffinity.leading : 先頭にチェックボックスを配置する
            // - ListTileControlAffinity.trailing : 末尾にチェックボックスを配置する
            // - ListTileControlAffinity.platform : 実行しているプラットフォームに応じて一般的な位置にチェックボックスを配置する
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                _checkItems[index] = value!;
              });
            }),
      ),
    );
  }

  /// チェックリストのダイアログを表示する
  void _showCheckListDialog() {
    final sb = StringBuffer();
    for (int i = 0; i < _checkItems.length; i++) {
      sb.writeln('CheckItem${i + 1} : ${_checkItems[i]}');
    }

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('CheckList'),
          content: Text(sb.toString()),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                // ダイアログを閉じる
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
