import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// ImageWidgetで下の画像を配置する
/// - アプリ内の固定リソースの画像
/// - ネットワーク上の画像
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: createImageWidgetList(),
          ),
        ),
      ),
    );
  }

  /// ImageWidgetのリストを生成
  List<Widget> createImageWidgetList() {
    const double imageWidth = 256;
    const double imageHeight = 128;

    return [
      Image.asset('images/river_00004.jpg',
          width: imageWidth, height: imageHeight, fit: BoxFit.fitHeight),
      Image.asset('images/river_00005.jpg',
          width: imageWidth, height: imageHeight, fit: BoxFit.fitHeight),
      const Image(
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
      Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.fitHeight)
    ];
  }
}
