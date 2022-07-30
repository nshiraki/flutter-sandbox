import 'package:flutter/material.dart';

/// ボタンとダイアログを利用する処理を作成する
/// showDialogで、閉じるボタン、SimpleDialog、AlertDialog、の３種類のダイアログを表示し、戻り値をテキストで表示する
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
  // ダイアログの結果を格納
  String _resultString = 'result';

  @override
  void initState() {
    super.initState();
    // 結果を初期化
    setState(() {
      _setResultString('---');
    });
  }

  @override
  Widget build(BuildContext context) {
    const margin = 48.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DialogEx'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: margin),
            Text(_resultString),
            const SizedBox(height: margin),
            ElevatedButton(
                onPressed: _showDialog, child: const Text('showDialog')),
            const SizedBox(height: margin),
            ElevatedButton(
                onPressed: _showSimpleDialog,
                child: const Text('SimpleDialog')),
            const SizedBox(height: margin),
            ElevatedButton(
                onPressed: _showAlertDialog, child: const Text('AlertDialog')),
          ],
        ),
      ),
    );
  }

  // showDialogで任意のウィジェットを表示
  // closeをタップすると「close」を返却する
  Future<void> _showDialog() async {
    var result = await showDialog(
      context: context,
      builder: (_) {
        // 任意のウィジェットを表示
        return FittedBox(
          fit: BoxFit.none,
          child: ElevatedButton(
            child: const Text('close'),
            onPressed: () {
              // ダイアログを閉じて結果を返却する
              Navigator.pop(context, 'close');
            },
          ),
        );
      },
    );
    setState(() => _setResultString(result));
  }

  // ダイアログの結果を更新する
  void _setResultString(String result) {
    _resultString = 'result: $result';
  }

  // showDialogでSimpleDialogを表示
  // 選択項目をタップすると選択した項目のラベルを返却
  Future<void> _showSimpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: const Text('タイトル'),
          children: <Widget>[
            // ダイアログの選択項目
            SimpleDialogOption(
              child: const Text('Item1'),
              onPressed: () {
                // ダイアログを閉じて結果を返却する
                Navigator.pop(context, 'Item1');
              },
            ),
            // ダイアログの選択項目
            SimpleDialogOption(
              child: const Text('Item2'),
              onPressed: () {
                // ダイアログを閉じて結果を返却する
                Navigator.pop(context, 'Item2');
              },
            ),
          ],
        );
      },
    );
    setState(() => _setResultString(result));
  }

  // showDialogでAlertDialogを表示
  // OKボタンタップすると「OK」を返却
  Future<void> _showAlertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('タイトル'),
          content: const Text('本文'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                // ダイアログを閉じて結果を返却する
                Navigator.pop(context, 'OK');
              },
            ),
          ],
        );
      },
    );
    setState(() => _setResultString(result));
  }
}
