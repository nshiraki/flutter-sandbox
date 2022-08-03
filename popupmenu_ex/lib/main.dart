import 'package:flutter/material.dart';

/// ポップアップメニューボタンを利用した処理を作成する
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

/// メニューコマンドのenum定義
enum MenuCommand {
  item1,
  item2,
  item3,
  item4,
  reset;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PopupMenuEx'),
          actions: [
            PopupMenuButton<MenuCommand>(
              // アイコンの指定（省略した場合は三点リーダーが表示される）
              icon: const Icon(Icons.android),
              onSelected: (MenuCommand menuCommand) {
                // メニュー選択時の処理
                setState(() {
                  final isResetCommand = menuCommand == MenuCommand.reset;
                  _selectedMenu =
                      isResetCommand ? '' : menuCommand.name.toString();
                });
              },
              // ポップアップメニューアイテムのビルド
              itemBuilder: (BuildContext context) {
                return _buildMenuItem();
              },
            )
          ],
        ),
        body: Center(
          child: Text('$_selectedMenu',
              style: const TextStyle(color: Colors.black, fontSize: 48)),
        ));
  }

  // ポップアップメニューアイテムをビルドする
  // MenuCommandは上で定義したenum
  List<PopupMenuEntry<MenuCommand>> _buildMenuItem() =>
      <PopupMenuEntry<MenuCommand>>[
        const PopupMenuItem<MenuCommand>(
          value: MenuCommand.item1,
          child: Text('Item 1'),
        ),
        const PopupMenuItem<MenuCommand>(
          value: MenuCommand.item2,
          child: Text('Item 2'),
        ),
        const PopupMenuItem<MenuCommand>(
          value: MenuCommand.item3,
          child: Text('Item 3'),
        ),
        const PopupMenuItem<MenuCommand>(
          value: MenuCommand.item4,
          child: Text('Item 4'),
        ),
        const PopupMenuDivider(height: 8),
        const PopupMenuItem<MenuCommand>(
          value: MenuCommand.reset,
          child: Text('reset'),
        ),
      ];
}
