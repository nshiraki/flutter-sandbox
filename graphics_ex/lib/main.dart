import 'package:flutter/material.dart';

/// CustomPaintで図形を描画する
/// - ライン
/// - パス
/// - 四角形
/// - 四角形塗りつぶし
/// - 角丸矩形
/// - 角丸矩形塗りつぶし
/// - 円
/// - 円塗りつぶし
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GraphicsEx'),
        ),
        body: CustomPaint(
          painter: _SamplePainter(),
        ),
      ),
    );
  }
}

class _SamplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // 描画オブジェクトの生成
    final paint = Paint();

    // ライン
    paint.color = const Color.fromARGB(255, 255, 0, 0);
    Offset startOffset = const Offset(25, 5);
    Offset endOffset = const Offset(25, 5 + 40);
    canvas.drawLine(startOffset, endOffset, paint);

    // パス
    paint.style = PaintingStyle.stroke;
    Path path = Path()
      ..moveTo(55 + 0, 5 + 0)
      ..lineTo(55 + 30, 5 + 5)
      ..lineTo(55 + 10, 5 + 20)
      ..lineTo(55 + 40, 5 + 25)
      ..lineTo(55 + 0, 5 + 40);
    canvas.drawPath(path, paint);

    // 四角形
    paint.style = PaintingStyle.stroke;
    paint.color = const Color.fromARGB(255, 0, 0, 255);
    canvas.drawRect(
        const Rect.fromLTRB(5 + 0, 50 + 0, 5 + 40, 50 + 40),
        paint
    );

    // 四角形塗りつぶし
    paint.style = PaintingStyle.fill;
    paint.color = const Color.fromARGB(255, 0, 0, 255);
    canvas.drawRect(
        const Rect.fromLTRB(55 + 0, 50 + 0, 55 + 40, 50 + 40),
        paint
    );

    // 角丸矩形
    paint.style = PaintingStyle.stroke;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            const Rect.fromLTRB(5 + 0, 100 + 0, 5 + 40, 100 + 40),
            const Radius.circular(10)
        ),
        paint
    );

    // 角丸矩形塗りつぶし
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            const Rect.fromLTRB(55 + 0, 100 + 0, 55 + 40, 100 + 40),
            const Radius.circular(10)
        ),
        paint
    );

    // 円
    paint.style = PaintingStyle.stroke;
    paint.color = const Color.fromARGB(255,255,255,0);
    canvas.drawCircle(const Offset(25, 170), 20, paint);

    // 円塗りつぶし
    paint.style = PaintingStyle.fill;
    paint.color = const Color.fromARGB(255,255,255,0);
    canvas.drawCircle(const Offset(75,170), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
