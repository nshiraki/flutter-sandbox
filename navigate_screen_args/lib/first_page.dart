import 'package:flutter/material.dart';
import 'package:navigate_screen_args/second_page.dart';

class FirstPage extends StatelessWidget {
  String inputText = '';

  /// コンストラクタ
  FirstPage({Key? key}) : super(key: key) {
    // NOP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  inputText = text;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // 次の画面を表示
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(inputText)
                    ),
                  );
                },
                child: const Text('Move to next')),
          ],
        ),
      ),
    );
  }
}
