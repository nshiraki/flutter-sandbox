import 'package:flutter/material.dart';

/// テキスト表示する処理を作成する
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
      home: const MyHomePage(title: 'TextWidgetEx'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // 余白
            const SizedBox(height: 16),
            // テキスト（プロパティの指定なし）
            const Text('Default'),
            // 余白
            const SizedBox(height: 16),
            // テキスト（太さを指定）
            const Text('fontWeight: bold',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // 余白
            const SizedBox(height: 16),
            // テキスト（スタイルを指定）
            const Text('fontStyle: italic',
                style: TextStyle(fontStyle: FontStyle.italic)),
            // 余白
            const SizedBox(height: 16),
            // テキスト（色とサイズを指定）
            Column(children: _buildColorSizeTextWidgets()),
            // 余白
            const SizedBox(height: 16),
            // 表示位置を指定(中央左寄せ)
            _buildContainerText(
                data: 'vertical center left',
                backgroundColor: Colors.yellowAccent,
                alignment: Alignment.centerLeft),
            // 表示位置を指定(中央右寄せ)
            _buildContainerText(
                data: 'vertical center right',
                backgroundColor: Colors.cyanAccent,
                alignment: Alignment.centerRight),
            // 表示位置を指定(中央寄せ)
            _buildContainerText(
                data: 'vertical center',
                backgroundColor: Colors.yellowAccent,
                alignment: Alignment.center,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  /// Textを含んだコンテナを返却
  ///
  /// [data] 表示文字列
  /// [backgroundColor] コンテナの背景色
  /// [alignment] コンテナのプロパティで指定する表示位置
  /// [textAlign] テキストのプロパティで指定する表示位置
  Widget _buildContainerText({
    required String data,
    required Color backgroundColor,
    Alignment? alignment,
    TextAlign? textAlign,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      // コンテナのプロパティで表示位置を指定
      alignment: alignment,
      // コンテナの背景色を指定
      color: backgroundColor,
      width: double.infinity,
      height: 64,
      child: Text(data,
          // テキストのプロパティで表示位置を指定
          textAlign: textAlign,
          style: const TextStyle(color: Colors.black, fontSize: 24)),
    );
  }

  /// 色とサイズを少しずつ変更したTextWidgetをリストで返却
  List<Widget> _buildColorSizeTextWidgets() {
    var widgetList = <Widget>[];
    var size = 16.0;
    var color = 100;

    for (var i = 0; i < 8; i++) {
      widgetList.add(Text('fontSize = $size',
          style: TextStyle(color: Colors.deepPurple[color], fontSize: size)));
      // 色とサイズを変更
      color += 100;
      size += 4;
    }
    return widgetList;
  }
}
