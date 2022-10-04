import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_ex/model/playlist_items.dart';
import 'package:dio_ex/playlist_repository.dart';
import 'package:flutter/material.dart';

/// dioを利用してSpotifyのプレイリストのアイテムを取得する処理を作成する
/// 利用するパッケージ
/// - https://pub.dev/packages/dio
/// 他利用パッケージ
/// - https://pub.dev/packages/freezed
/// - https://pub.dev/packages/freezed_annotation
/// - https://pub.dev/packages/build_runner
/// - https://pub.dev/packages/json_serializable
/// - https://pub.dev/packages/json_annotation
/// - https://pub.dev/packages/cached_network_image
///
/// freezedのコード生成
/// - https://app.quicktype.io/#l=Dart
///
/// Spotify
///
/// App Settings
/// - https://developer.spotify.com/documentation/general/guides/authorization/app-settings/
///
/// Client Credentials Flow
/// - https://developer.spotify.com/documentation/general/guides/authorization/client-credentials/
///
/// Web API
/// - https://developer.spotify.com/documentation/web-api/reference/#/operations/get-playlists-tracks
///
/// Console
/// - https://developer.spotify.com/console/get-playlist-tracks/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final repository = PlaylistItemsRepository();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('DioEx'),
      ),
      body: Container(
        // 背景色
        color: Colors.blueGrey[900],
        child: FutureBuilder<PlaylistItems>(
          future: repository.fetchPlaylistItems(),
          builder:
              (BuildContext context, AsyncSnapshot<PlaylistItems> snapshot) {
            if (snapshot.hasData) {
              // 取得データからリストを生成
              return ListView.builder(
                itemCount: snapshot.data?.items.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var item = snapshot.data?.items[index];
                  var imageUrl = item!.track!.album!.images.first.url;
                  var trackName = item.track!.name;
                  var artistNames =
                      item.track!.artists.map((e) => e.name).join(', ');
                  var albumName = item.track!.album!.name;

                  return Container(
                    padding: const EdgeInsets.only(
                      left: 32,
                      top: 16,
                      right: 32,
                      bottom: 32,
                    ),
                    child: Column(
                      children: <Widget>[
                        // カバー画像
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        // トラック名、アーティスト名、アルバム名
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 余白
                              const SizedBox(height: 16.0),
                              // トラック名
                              Text(
                                textAlign: TextAlign.left,
                                trackName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // 余白
                              const SizedBox(height: 4.0),
                              // アーティスト名
                              Text(
                                textAlign: TextAlign.left,
                                artistNames,
                                style: TextStyle(
                                  color: Colors.blueGrey[300],
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              // 余白
                              const SizedBox(height: 4.0),
                              // アルバム名
                              Text(
                                textAlign: TextAlign.left,
                                albumName,
                                style: TextStyle(
                                  color: Colors.blueGrey[300],
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
