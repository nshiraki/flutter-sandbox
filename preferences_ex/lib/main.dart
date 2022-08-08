import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// プリファレンスの読み書きを行う処理を作成
/// - shared_preferencesを利用してメッセージの保存と読み込みを行う処理を作成する
/// パッケージ
/// -　https://pub.dev/packages/shared_preferences
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
      home: const MyHomePage(title: 'PreferencesEx'),
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
  // テキストフィールドのコントローラー
  late TextEditingController _controller;
  // プリファレンスの読み書きで使用するキー
  final String _prefKey = 'pref_key_message';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // テキストフィールド
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  // NOP
                },
              ),
              // 余白
              const SizedBox(height: 32),
              // 保存ボタン
              ElevatedButton(
                  onPressed: () async {
                    // データを保存
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString(_prefKey, _controller.text);
                  },
                  child: const Text('Save Message')),
              // 読み込みボタン
              ElevatedButton(
                  onPressed: () async {
                    // データを読み込み
                    final prefs =   await SharedPreferences.getInstance();
                    final newText = prefs.getString(_prefKey) ?? '';
                    setState(() {
                      _controller.text = newText;
                    });
                  },
                  child: const Text('Load Message')),
            ],
          ),
        ),
      ),
    );
  }
}
