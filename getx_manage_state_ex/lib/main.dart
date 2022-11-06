import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// GetXを利用して状態管理を行う処理を作成する
/// 利用パッケージ
/// - https://pub.dev/packages/get
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

/// ViewModel
class MyHomePageViewModel extends GetxController {
  // 監視するカウント値
  RxInt count = 0.obs;

  /// カウント値を加算
  void incrementCount() {
    count.value++;
  }

  /// <!-- GetxControllerのライフサイクル処理（確認用でdumpするだけ）
  /// ウィジェットがメモリに割り当てられた直後に呼び出される。
  @override
  void onInit() {
    print('onInit');
    super.onInit();
  }

  /// onInit()の1フレーム後に呼び出される
  @override
  void onReady() {
    print('onReady');
    super.onReady();
  }

  /// onDeleteメソッドの前に呼び出される。controllerがメモリから削除される直前に実行される。
  @override
  void onClose() {
    print('onClose');
    super.onClose();
  }

  /// GetxControllerのライフサイクル処理（確認用でdumpするだけ）-->
}

/// View
class MyHomePage extends StatelessWidget {
  // Get.putを利用して、viewModelの依存オブジェクトを注入
  // NOTE: 他クラスで依存を注入しておいて、Get.findで依存オブジェクトを取り出すこともできる
  final _viewModel = Get.put(MyHomePageViewModel());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX ManageStateEx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              // 監視している値を表示
              () => Text(
                '${_viewModel.count.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _viewModel.incrementCount(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
