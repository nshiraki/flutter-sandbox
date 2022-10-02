import 'package:dio_ex/api_client.dart';
import 'package:dio_ex/model/playlist_items.dart';

/// PlaylistItemsRepository
class PlaylistItemsRepository {
  // アクセストークンを取得
  Future<String?> _auth() async {
    try {
      final result = await ApiClient().auth();
      final json = result as Map<String, dynamic>;
      String? token = json['access_token'] as String?;
      return token;
    } catch (e) {
      throw Exception(e);
    }
  }

  /// プレイリストアイテムを取得
  Future<PlaylistItems> fetchPlaylistItems() async {
    try {
      final result = await ApiClient().getPlaylistItems(
        accessToken: await _auth(),
        playlistId: ApiClient.playlistId,
      );
      final json = result as Map<String, dynamic>;
      return PlaylistItems.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }
}
