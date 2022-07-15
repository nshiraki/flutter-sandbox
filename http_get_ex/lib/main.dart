import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/// GETメソッドでHTTP通信を行う
void main() {
  runApp(const HttpGetApp());
}

/// HttpGetApp
class HttpGetApp extends StatefulWidget {
  const HttpGetApp({Key? key}) : super(key: key);

  @override
  HttpGetAppState createState() => HttpGetAppState();
}

/// HttpGetAppState
class HttpGetAppState extends State<HttpGetApp> {
  final url = 'https://jsonplaceholder.typicode.com/albums';
  var _albumJson = [];

  void fetchData() async {
    try {
      // HTTP通信を行う
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      // UIを更新する
      setState((){
        _albumJson = jsonData;
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    // Stateの初期化
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HttpGetEx',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('HttpGetEx'),
          ),
          body: ListView.builder(
              itemCount: _albumJson.length,
              itemBuilder: (BuildContext context, int index) {
                final post = _albumJson[index];
                final sb = StringBuffer();
                sb.writeln("userId: ${post["userId"]}");
                sb.writeln("id: ${post["id"]}");
                sb.writeln("title: ${post["title"]}");

                return Text(sb.toString());
              })),
    );
  }
}
