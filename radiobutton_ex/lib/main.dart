import 'package:flutter/material.dart';

/// ラジオボタンを利用した処理を作成する
/// - ラジオボタンの選択項目を縦に複数個並べて配置
/// - 選択中の項目を表示するボタンを配置
///     - ボタンをタップすると選択した項目の内容をダイアログで表示
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

/// ラジオボタン項目のenum
enum RadioItem {
  item1('item1'),
  item2('item2'),
  item3('item3'),
  item4('item4'),
  // 無効値
  none('Not selected');

  // コンストラクタ
  const RadioItem([this.value]);

  final String? value;
}

class _MyHomePageState extends State<MyHomePage> {
  // 選択中のアイテム
  RadioItem _selectedItem = RadioItem.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RadioButtonEx'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          // ラジオボタンの項目を作成
          _buildRadioListTile(RadioItem.item1),
          _buildRadioListTile(RadioItem.item2),
          _buildRadioListTile(RadioItem.item3),
          _buildRadioListTile(RadioItem.item4),
          // 選択中の項目を表示するボタン
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // 選択中のアイテムを表示
                _showSelectedItemDialog(_selectedItem);
              },
              child: const Text('Show Selected RadioItem'),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildRadioListTile(RadioItem radioItem) {
    String displayName = radioItem.value.toString();

    // RadioListTileを生成
    RadioListTile tile = RadioListTile(
      title: Text(displayName),
      // このボタンに割り当てる値
      value: radioItem,
      // ラジオグループの値
      // - groupValueとvalueの値が一致した場合に、このボタンが選択される
      groupValue: _selectedItem,
      onChanged: (value) {
        setState(() {
          // 選択中の項目を更新
          _selectedItem = value;
        });
      },
    );

    // Widgetを返却
    return Center(child: SizedBox(width: 360, height: 64, child: tile));
  }

  /// 選択中のラジオボタンの項目を表示する
  void _showSelectedItemDialog(RadioItem selectedItem) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Selected RadioItem'),
          content: Text(selectedItem.value.toString()),
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
