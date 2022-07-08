import 'package:flutter/material.dart';

/// SecondPage
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // 前の画面に戻る
              Navigator.pop(context);
            },
            child: const Text('Go back')),
      ),
    );
  }
}
