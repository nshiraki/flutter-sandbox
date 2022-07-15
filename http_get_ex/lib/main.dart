import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Album.dart';

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
  final List<Album> _albumList = [];

  @override
  void initState() {
    super.initState();

    // リストをクリア
    updateList(List.empty());

    // データを取得
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
              itemCount: _albumList.length,
              itemBuilder: (BuildContext context, int index) {
                final album = _albumList[index];

                final sb = StringBuffer();
                sb.writeln("userId: ${album.userId}");
                sb.writeln("id: ${album.id}");
                sb.writeln("title: ${album.title}");

                return Text(sb.toString());
              })),
    );
  }

  // リストを更新
  void updateList(List<Album> list) => setState(() {
    _albumList.addAll(list);
  });

  // データを取得
  void fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      updateList(jsonData.map((e) => Album.fromJson(e)).toList());
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
