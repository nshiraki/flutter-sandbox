import 'package:flutter/material.dart';

/// Heroを利用した処理を作成する
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> images = [
      "assets/images/bike_auto_race.png",
      "assets/images/bike_big_scooter_woman.png",
      "assets/images/bike_helmet_woman.png",
      "assets/images/bike_offroad_motocross.png",
      "assets/images/bike_offroad_motocross_man.png",
      "assets/images/norimono_bike.png"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('HeroEx'),
      ),
      body: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ImageGridItem(assetImage: images[index]);
            }),
      ),
    );
  }
}

/// 画像一覧表示用のアイテム
/// [assetImage]アセット画像のパス
class ImageGridItem extends StatelessWidget {
  final String assetImage;

  const ImageGridItem({Key? key, required this.assetImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        // NOTE: アセット画像のパスをHeroのtagとして扱う
        tag: assetImage,
        child: Image.asset(assetImage, fit: BoxFit.cover),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePreviewPage(assetImage: assetImage),
          ),
        );
      },
    );
  }
}

/// アイテム一覧で選択した画像を表示するページ
/// [assetImage]アセット画像のパス
class ImagePreviewPage extends StatelessWidget {
  final String assetImage;

  const ImagePreviewPage({Key? key, required this.assetImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        // NOTE: アセット画像のパスをHeroのtagとして扱う
        tag: assetImage,
        child: Container(
          color: Colors.white,
          child: Image.asset(assetImage),
        ),
      ),
    );
  }
}
