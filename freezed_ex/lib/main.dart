import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_ex/product.dart';
import 'package:freezed_ex/products.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

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
///
/// 取得先のAPI
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
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 通信中の場合（非同期処理中）
              return const Center(child: CircularProgressIndicator());
            }

            // 通信エラーの場合
            if (snapshot.error != null) {
              return const Center(child: Text('データの取得に失敗'));
            }

            // 成功の場合
            final jsonString = snapshot.data?.toString();
            // jsonが不正だった場合
            if (jsonString == null) {
              return const Center(child: Text('データの取得に失敗'));
            }

            // リストを生成
            final products = Products.fromJson(jsonDecode(jsonString));
            items = products.products;

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
          }),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // サムネイル画像
            CachedNetworkImage(
              imageUrl: product.thumbnail,
              imageBuilder: (context, imageProvider) => Image(
                  width: double.infinity, height: 300, image: imageProvider),
              placeholder: (context, url) => const Icon(Icons.image),
              errorWidget: (context, url, error) => const Icon(Icons.image),
            ),
            // 余白
            const SizedBox(height: 16),
            // タイトル
            SizedBox(
              width: double.infinity,
              child: Text(
                product.title,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            // 区切り線
            const Divider(height: 32, color: Colors.grey),
            // 価格
            SizedBox(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.left,
                '${product.price}\$',
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
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
            // 余白
            const SizedBox(height: 16),
            // サブ画像
            ProductSubImageListItem(imageUrls: product.images),
          ],
        ),
      ),
    );
  }
}

/// 商品のサブ画像のリストを表示するWidget
/// [imageUrls]商品のサブ画像のリスト
class ProductSubImageListItem extends StatelessWidget {
  const ProductSubImageListItem({required this.imageUrls, Key? key})
      : super(key: key);

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          // リストアイテムを生成
          return CachedNetworkImage(
            color: Colors.grey,
            width: 100,
            height: 100,
            imageUrl: imageUrls[index],
            imageBuilder: (context, imageProvider) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(image: imageProvider),
              );
            },
            placeholder: (context, url) => const Icon(Icons.image),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8, height: double.infinity);
        },
      ),
    );
  }
}
