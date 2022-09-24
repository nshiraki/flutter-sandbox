import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tuple/tuple.dart';

///　PageViewを利用して、スワイプ操作で画面を切り替える処理を作成する
///
/// 利用パッケージ
/// - tuple
///    - 複数の戻り値を返す
/// - smooth_page_indicator
///    - PageViewのインジケーター表示
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();

  /// アイテムデータ
  /// item1 -> 背景カラー
  /// item2 -> テキストカラー
  final items = const [
    Tuple2<Color, Color>(Colors.cyanAccent, Colors.black),
    Tuple2<Color, Color>(Colors.yellowAccent, Colors.black),
    Tuple2<Color, Color>(Colors.orangeAccent, Colors.white),
    Tuple2<Color, Color>(Colors.deepPurpleAccent, Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    /// ページアイテムのリストを生成
    final pages = List.generate(items.length, (index) {
      final t = items[index];
      return _createPageItem(
        text: 'Page ${index + 1}',
        backgroundColor: t.item1,
        textColor: t.item2,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewEx'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: pages,
            // children: list,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    axisDirection: Axis.horizontal,
                    controller: _pageController,
                    count: pages.length,
                    effect: const WormEffect(),
                    onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInCubic),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// ページアイテムを生成
  Widget _createPageItem(
      {required String text,
      required Color backgroundColor,
      required Color textColor}) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(text, style: TextStyle(color: textColor, fontSize: 24)),
      ),
    );
  }
}
