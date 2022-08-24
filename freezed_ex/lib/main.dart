import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_ex/product.dart';
import 'package:freezed_ex/products.dart';
import 'package:http/http.dart' as http;

/// Freezedを利用した処理を作成する
///
/// やること
/// - FlutterのFreezedパッケージを導入する
/// - Freezedでjsonをシリアライズするモデルのクラスを作成する
/// - モックのAPIを叩いてHTTP通信を行う
/// - HTTP通信して得たjsonをモデルのクラスにシリアライズする
/// - jsonをシリアライズしたモデルをリストで表示する
///
/// 追加するパッケージ(jsonのシリアライズまでやるので全部入れる)
/// - https://github.com/rrousselGit/freezed#install
/// """
/// flutter pub add freezed_annotation
/// flutter pub add --dev build_runner
/// flutter pub add --dev freezed
/// # if using freezed to generate fromJson/toJson, also add:
/// flutter pub add json_annotation
/// flutter pub add --dev json_serializable
/// """
///
/// 叩くAPI
/// - https://dummyjson.com/products
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
  List<Product> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('FreezedEx'),
      ),
      body: FutureBuilder(
        future: _fetchData(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasData) {
            // データが有る場合
            var jsonString = snapshot.data?.toString();
            if (jsonString == null) {
              // データ取得失敗
              return const Center(child: Text('データの取得に失敗しました'));
            }
            // jsonからアイテムを生成
            var products = Products.fromJson(jsonDecode(jsonString));
            items = products.products;
            var shouldShowEmpty = items.isEmpty;
            if (shouldShowEmpty) {
              // データが0件だった場合
              return const Center(child: Text('表示可能なデータがありませんでした'));
            }

            // リストを生成
            return Container(
              padding: const EdgeInsets.all(8),
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  // リストアイテムを生成
                  return ProductListItem(product: items[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  // 区切り線の表示
                  return const Divider(height: 16, color: Colors.white);
                },
              ),
            );
          }

          if (snapshot.hasError) {
            // データ取得失敗
            return const Center(child: Text('データの取得に失敗しました'));
          }

          // データ取得中
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  /// データを取得する処理
  Future<String?> _fetchData() async {
    // リモートからデータを取得
    const url = 'https://dummyjson.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }

    return null;
  }
}

/// 商品のリスト項目を表示するWidget
/// [product]商品のリスト項目
class ProductListItem extends StatelessWidget {
  const ProductListItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // サムネイル画像
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: const Center(
                        child: Text('No Image',
                            style: TextStyle(color: Colors.white))),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            // テキスト表示
            SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    backgroundColor: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 余白
                    const SizedBox(height: 16),
                    // タイトル
                    Text(
                      product.title,
                      style: const TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    // 区切り線
                    const Divider(
                      height: 32,
                      color: Colors.grey,
                    ),
                    // 価格
                    Text(
                      '${product.price}\$',
                      style: const TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    // 割引率
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 0),
                      title: const Text('Discount Percentage'),
                      subtitle: Text('-${product.discountPercentage}%'),
                    ),
                    // ブランド
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 0),
                      title: const Text('Brand'),
                      subtitle: Text(product.brand),
                    ),
                    // カテゴリ
                    ListTile(
                        contentPadding: const EdgeInsets.only(left: 0),
                        title: const Text('Category'),
                        subtitle: Text(product.category)),
                    // カテゴリ
                    ListTile(
                        contentPadding: const EdgeInsets.only(left: 0),
                        title: const Text('Description'),
                        subtitle: Text(product.description)),
                  ],
                ),
              ),
            ),
            // 余白
            const SizedBox(height: 16),
            // images
            ProductSubImageListItem(product.images),
          ],
        ),
      ),
    );
  }
}

/// 商品サブ画像のリストを表示するWidget
/// [_images]商品サブ画像のリスト
class ProductSubImageListItem extends StatelessWidget {
  const ProductSubImageListItem(this._images, {Key? key}) : super(key: key);

  final List<String> _images;
  final size = 100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          // リストアイテムを生成
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: Image.network(_images[index], fit: BoxFit.cover),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8, height: double.infinity);
        },
      ),
    );
  }
}
