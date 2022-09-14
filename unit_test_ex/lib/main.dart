import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_test_ex/calculator.dart';

/// UnitTestを行う処理を作成する
///
/// やること
/// 簡単な計算を行う処理を作成して、計算を行う処理に対してUnitTestを書く
/// - 数値形式の文字列を入力させて、加算した結果を表示する処理を作成する
/// - 加算する処理はテストが書けるように別クラスで作成しておく
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
  // 数値入力用のTextEditingController
  final inputController1 = TextEditingController(text: '');
  final inputController2 = TextEditingController(text: '');

  // 計算結果
  String calcResult = "";

  @override
  void dispose() {
    // TextEditingControllerを廃棄
    inputController1.dispose();
    inputController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnitTestEx'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // タイトル
            const Text(
              'Add Two Numbers',
              style: TextStyle(fontSize: 16),
            ),
            // 加算する数値の入力フィールド1
            TextField(
                decoration: const InputDecoration(
                  labelText: "Num1",
                ),
                controller: inputController1,
                keyboardType: TextInputType.number,
                // 整数のみ許可
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly]),
            const SizedBox(
              height: 16,
            ),
            // 加算する数値の入力フィールド2
            TextField(
                decoration: const InputDecoration(
                  labelText: "Num2",
                ),
                controller: inputController2,
                keyboardType: TextInputType.number,
                // 整数のみ許可
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            const SizedBox(
              height: 16,
            ),
            // 加算した結果を表示するボタン
            // （入力した数値が不正な値の場合、入力エラーを表示）
            ElevatedButton(
              onPressed: () {
                // 結果を更新
                setState(() {
                  calcResult = Calculator.calcAdd(
                          inputController1.text, inputController2.text) ??
                      'Input error!';
                });
                FocusScope.of(context).unfocus();
              },
              child: const Text('Add'),
            ),
            // 加算して結果を表示するテキスト
            TextField(
              enabled: false,
              decoration: const InputDecoration(
                labelText: "Result",
              ),
              controller: TextEditingController(text: calcResult),
            ),

            // 数値入力と結果をクリアするボタン
            ElevatedButton(
              onPressed: () {
                // 結果を更新
                setState(() {
                  inputController1.text = '';
                  inputController2.text = '';
                  calcResult = '';
                  FocusScope.of(context).unfocus();
                });
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
