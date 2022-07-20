import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// POSTリクエストでHTTP通信を行う
/// - POSTリクエストでデータを投稿する
/// - 投稿に成功したらアラートダイアログで結果を表示する
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HttpPostPage(),
    );
  }
}

class HttpPostPage extends StatelessWidget {
  const HttpPostPage({Key? key}) : super(key: key);
  final url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HttpPostEx'),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            postData(context);
          },
          child: const Text('Send Post'),
        )));
  }

  // データを投稿する
  void postData(BuildContext context) async {
    try {
      // POSTリクエストで投稿する
      final response = await http.post(Uri.parse(url),
          body: {"title": "Anything", "body": "Post body", "userId": "9999"});

      // 投稿したデータを表示
      showAlertDialog(
          context: context, title: 'Posted Data', content: response.body);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  // 投稿したデータをアラートダイアログで表示する
  void showAlertDialog(
      {required BuildContext context,
      required String title,
      required String content}) {
    // AlertDialogを生成
    var alert =
        AlertDialog(title: Text(title), content: Text(content), actions: [
      TextButton(
          onPressed: () {
            // ダイアログを閉じる
            Navigator.of(context).pop();
          },
          child: const Text('OK'))
    ]);

    // AlertDialogを表示
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
