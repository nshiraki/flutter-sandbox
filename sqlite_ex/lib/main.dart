import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_ex/database_helper.dart';

import 'note.dart';

/// sqfliteを利用してローカルデータベースの読み書きを行う処理を作成する
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
      home: const MyHomePage(title: 'SqliteEx'),
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
  List<Note> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                // アイテムのWidgetを生成
                return Card(
                  // color: Colors.orange[200],
                  margin: const EdgeInsets.all(16),
                  child: ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.text),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => _showBottomSheet(item),
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () => _deleteItem(item),
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showBottomSheet(null),
      ),
    );
  }

  void _refreshItems() async {
    final items = await DatabaseHelper.getItems();
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  /// BottomSheetを表示する
  void _showBottomSheet(Note? item) async {
    // テキストフィールドを初期化
    _titleController.text = '';
    _textController.text = '';
    // 更新の場合は、リストから既存のアイテムを取得してテキストフィールドを設定する
    if (item != null) {
      // リストから最初に一致する既存のアイテムを取得
      Note? existingItem = _items.firstWhereOrNull((Note note) {
        return note.id == item.id;
      });
      // 既存のアイテムのタイトルと本文を設定
      if (existingItem != null) {
        _titleController.text = existingItem.title;
        _textController.text = existingItem.text;
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // キーボードの高さを取得
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: keyboardHeight + 16,
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(hintText: 'タイトル'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(hintText: '本文'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: Text(item == null ? '追加' : '更新'),
                  onPressed: () async {
                    if (item != null) {
                      // 更新
                      await _updateItem(item);
                    } else {
                      // 新規追加
                      await _addItem();
                    }
                    // BottomSheetを閉じる
                    if(mounted){
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// アイテムを削除する
  Future<void> _deleteItem(Note item) async {
    await DatabaseHelper.deleteItem(item.id);

    _showSnackBar('アイテムを削除しました');

    _refreshItems();
  }

  /// アイテムを追加する
  Future<void> _addItem() async {
    await DatabaseHelper.insertItem(
      _titleController.text,
      _textController.text,
    );
    _showSnackBar('アイテムを追加しました');
    _refreshItems();
  }

  /// アイテムを更新する
  Future<void> _updateItem(Note item) async {
    await DatabaseHelper.updateItem(
      item.id,
      _titleController.text,
      _textController.text,
    );
    _showSnackBar('アイテムを更新しました');
    _refreshItems();
  }

  /// スナックバー表示する
  void _showSnackBar(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
}
