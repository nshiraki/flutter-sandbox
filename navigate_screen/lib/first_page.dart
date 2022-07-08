import 'package:flutter/material.dart';
import 'package:navigate_screen/second_page.dart';

/// FirstPage
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // 次の画面を表示
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: const Text('Move to next')),
      ),
    );
  }
}
