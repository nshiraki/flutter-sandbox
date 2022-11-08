import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// GetXを利用してルート管理を行う処理を作成する
/// 利用パッケージ
/// - https://pub.dev/packages/get
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/second', page: () => const SecondPage()),
      ],
      home: MainPage(),
    );
  }
}

/// MainPageViewModel
class MainPageViewModel extends GetxController {
  /// SecondPageから返却された結果を監視
  final RxString result = '----'.obs;

  /// 結果をクリアするボタンが押下されたときにView側から呼ばれる処理
  void onClearResultButton() => result.value = '----';

  /// SecondPageから結果が返却されたときに呼ばれる
  /// [data]SecondPageから返却された結果
  void onSecondPageResult(String data) {
    result.value = data;
  }
}

/// MainPage
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final viewModel = Get.put(MainPageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Manage Route Ex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SecondPageから返却された結果を表示
            Obx(() => Text(
                  'SecondPageResult: ${viewModel.result.value}',
                  style: const TextStyle(fontSize: 24),
                )),
            // 余白
            const SizedBox(height: 16),
            // SecondPageから返却された結果の表示をクリアする
            ElevatedButton(
              child: const Text('clear SecondPageResult'),
              onPressed: () => viewModel.onClearResultButton(),
            ),
            // 余白
            const SizedBox(height: 16),
            // SecondPageに遷移するボタン
            ElevatedButton(
              child: const Text('Move to Second'),
              onPressed: () async {
                // SecondPageに渡すデータを生成
                final args = <String, dynamic>{
                  "message": "this is second page"
                };
                // SecondPageに遷移する
                final result = await Get.toNamed('/second', arguments: args);
                // SecondPageから返却された結果を受け取る
                viewModel.onSecondPageResult(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// SecondPage
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 遷移元から引数で渡されたデータを表示
            Text(Get.arguments['message'],
                style: const TextStyle(fontSize: 24)),
            // 余白
            const SizedBox(height: 16),
            // 前の画面に戻るボタン
            ElevatedButton(
              // MainPageに戻る
              child: const Text('Go back'),
              // ボタンを押下すると「success」という結果を返却して、前の画面に戻る
              onPressed: () => Get.back(result: 'success'),
            ),
          ],
        ),
      ),
    );
  }
}
