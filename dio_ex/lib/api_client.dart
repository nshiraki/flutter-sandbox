import 'dart:convert';

import 'package:dio/dio.dart';

/// ApiClient
class ApiClient {
  // TODO: Spotifyから払い出された client_id に置き換えてください
  static const String clientId = 'client_id';
  // TODO: Spotifyから払い出された client_secret に置き換てください
  static const String clientSecret = 'client_secret';
  static const playlistId = '3PTPCriTxre0K54jI1HA30';

  /// 認証を行い、アクセストークンの取得要求を行う
  Future auth() async {
    const url = 'https://accounts.spotify.com/api/token';
    const data = {'grant_type': 'client_credentials'};
    try {
      String input = '$clientId:$clientSecret';
      final clientCredentials = base64.encode(input.codeUnits);

      final dio = Dio();
      dio.options.headers['Content-Type'] =
          "application/x-www-form-urlencoded; charset=UTF-8";
      dio.options.headers['Authorization'] = "Basic $clientCredentials";

      // アクセストークンを返却
      final response = await dio.post(url, data: data);
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      return null;
    }
  }

  /// プレイリストのアイテムの取得要求をリクエストする
  Future getPlaylistItems({
    required String? accessToken,
    required String playlistId,
  }) async {
    String url = 'https://api.spotify.com/v1/playlists/$playlistId/tracks';
    try {
      final dio = Dio();
      dio.options.headers['Content-Type'] = "application/json";
      dio.options.headers['Authorization'] = "Bearer $accessToken";
      final response = await dio.get(url);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
