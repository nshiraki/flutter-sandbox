import 'package:flutter/material.dart';
///
///
/// SecondPage
class SecondPage extends StatelessWidget {
  final String message;

  /// コンストラクタ
  SecondPage(this.message, {Key? key}) : super(key: key){
    // NOP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message,
              style: const TextStyle(
                fontSize: 24
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // 前の画面に戻る
                  Navigator.pop(context);
                },
                child: const Text('Go back')),
          ],
        ),
      ),
    );
  }
}
