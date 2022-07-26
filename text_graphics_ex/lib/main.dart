import 'package:flutter/material.dart';

/// CustomPaintでテキストを描画する
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TextGraphicsEx'),
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size.infinite,
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // テキストの装飾
    // 色、フォントサイズ
    const textStyle = TextStyle(
      color: Colors.indigoAccent,
      fontSize: 24,
    );

    // 表示テキスト
    const textSpan = TextSpan(text: 'Hello, world.', style: textStyle);

    // テキスト描画用のペインター
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    // キャンバスの中央にテキストを描画
    final dx = size.width / 2 - textPainter.width / 2;
    final dy = size.height / 2 - textPainter.height / 2;
    var offset = Offset(dx, dy);
    // NOTE: TextPainter#paintの内部でCanvas#drawParagraph()を実行してテキストを描画している
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
