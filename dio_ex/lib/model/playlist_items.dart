// To parse this JSON data, do
//
//     final playlistItems = playlistItemsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'playlist_items.freezed.dart';

part 'playlist_items.g.dart';

PlaylistItems playlistItemsFromJson(String str) =>
    PlaylistItems.fromJson(json.decode(str));

String playlistItemsToJson(PlaylistItems data) => json.encode(data.toJson());

@freezed
abstract class PlaylistItems with _$PlaylistItems {
  const factory PlaylistItems({
    @Default('') String href,
    @Default([]) List<Item> items,
    @Default(0) limit,
    dynamic next,
    @Default(0) offset,
    dynamic previous,
    @Default(0) total,
  }) = _PlaylistItems;

  factory PlaylistItems.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemsFromJson(json);
}

@freezed
abstract class Item with _$Item {
  const factory Item({
    DateTime? addedAt,
    AddedBy? addedBy,
    @Default(false) bool isLocal,
    dynamic primaryColor,
    Track? track,
    VideoThumbnail? videoThumbnail,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
abstract class AddedBy with _$AddedBy {
  const factory AddedBy({
    ExternalUrls? externalUrls,
    @Default('') String href,
    @Default('') String id,
    AddedByType? type,
    @Default('') String uri,
    @Default('') String name,
  }) = _AddedBy;

  factory AddedBy.fromJson(Map<String, dynamic> json) =>
      _$AddedByFromJson(json);
}

@freezed
abstract class ExternalUrls with _$ExternalUrls {
  const factory ExternalUrls({
    @Default('') String spotify,
  }) = _ExternalUrls;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) =>
      _$ExternalUrlsFromJson(json);
}

enum AddedByType { user, artist }

final addedByTypeValues =
    EnumValues({"artist": AddedByType.artist, "user": AddedByType.user});

@freezed
abstract class Track with _$Track {
  const factory Track({
    Album? album,
    @Default([]) List<AddedBy> artists,
    @Default([]) List<String> availableMarkets,
    int? discNumber,
    int? durationMs,
    @Default(false) bool episode,
    @Default(false) bool explicit,
    ExternalIds? externalIds,
    ExternalUrls? externalUrls,
    @Default('') String href,
    @Default('') String id,
    @Default(false) bool isLocal,
    @Default('') String name,
    int? popularity,
    @Default('') String previewUrl,
    @Default(false) bool track,
    int? trackNumber,
    TrackType? type,
    @Default('') String uri,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

@freezed
abstract class Album with _$Album {
  const factory Album({
    AlbumTypeEnum? albumType,
    @Default([]) List<AddedBy> artists,
    @Default([]) List<String> availableMarkets,
    ExternalUrls? externalUrls,
    @Default('') String href,
    @Default('') String id,
    @Default([]) List<Image> images,
    @Default('') String name,
    DateTime? releaseDate,
    ReleaseDatePrecision? releaseDatePrecision,
    int? totalTracks,
    AlbumTypeEnum? type,
    @Default('') String uri,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}

enum AlbumTypeEnum { album, compilation, single }

final albumTypeEnumValues = EnumValues({
  "album": AlbumTypeEnum.album,
  "compilation": AlbumTypeEnum.compilation,
  "single": AlbumTypeEnum.single
});

@freezed
abstract class Image with _$Image {
  const factory Image({
    @Default(0) int height,
    @Default('') String url,
    @Default(0) int width,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

enum ReleaseDatePrecision { day }

final releaseDatePrecisionValues =
    EnumValues({"day": ReleaseDatePrecision.day});

@freezed
abstract class ExternalIds with _$ExternalIds {
  const factory ExternalIds({
    @Default('') String isrc,
  }) = _ExternalIds;

  factory ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdsFromJson(json);
}

enum TrackType { track }

final trackTypeValues = EnumValues({"track": TrackType.track});

@freezed
abstract class VideoThumbnail with _$VideoThumbnail {
  const factory VideoThumbnail({
    @Default('') String url,
  }) = _VideoThumbnail;

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) =>
      _$VideoThumbnailFromJson(json);
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
