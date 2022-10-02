// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaylistItems _$$_PlaylistItemsFromJson(Map<String, dynamic> json) =>
    _$_PlaylistItems(
      href: json['href'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      limit: json['limit'] ?? 0,
      next: json['next'],
      offset: json['offset'] ?? 0,
      previous: json['previous'],
      total: json['total'] ?? 0,
    );

Map<String, dynamic> _$$_PlaylistItemsToJson(_$_PlaylistItems instance) =>
    <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      addedAt: json['addedAt'] == null
          ? null
          : DateTime.parse(json['addedAt'] as String),
      addedBy: json['addedBy'] == null
          ? null
          : AddedBy.fromJson(json['addedBy'] as Map<String, dynamic>),
      isLocal: json['isLocal'] as bool? ?? false,
      primaryColor: json['primaryColor'],
      track: json['track'] == null
          ? null
          : Track.fromJson(json['track'] as Map<String, dynamic>),
      videoThumbnail: json['videoThumbnail'] == null
          ? null
          : VideoThumbnail.fromJson(
              json['videoThumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'addedAt': instance.addedAt?.toIso8601String(),
      'addedBy': instance.addedBy,
      'isLocal': instance.isLocal,
      'primaryColor': instance.primaryColor,
      'track': instance.track,
      'videoThumbnail': instance.videoThumbnail,
    };

_$_AddedBy _$$_AddedByFromJson(Map<String, dynamic> json) => _$_AddedBy(
      externalUrls: json['externalUrls'] == null
          ? null
          : ExternalUrls.fromJson(json['externalUrls'] as Map<String, dynamic>),
      href: json['href'] as String? ?? '',
      id: json['id'] as String? ?? '',
      type: $enumDecodeNullable(_$AddedByTypeEnumMap, json['type']),
      uri: json['uri'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$_AddedByToJson(_$_AddedBy instance) =>
    <String, dynamic>{
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'type': _$AddedByTypeEnumMap[instance.type],
      'uri': instance.uri,
      'name': instance.name,
    };

const _$AddedByTypeEnumMap = {
  AddedByType.user: 'user',
  AddedByType.artist: 'artist',
};

_$_ExternalUrls _$$_ExternalUrlsFromJson(Map<String, dynamic> json) =>
    _$_ExternalUrls(
      spotify: json['spotify'] as String? ?? '',
    );

Map<String, dynamic> _$$_ExternalUrlsToJson(_$_ExternalUrls instance) =>
    <String, dynamic>{
      'spotify': instance.spotify,
    };

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => AddedBy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      availableMarkets: (json['availableMarkets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      discNumber: json['discNumber'] as int?,
      durationMs: json['durationMs'] as int?,
      episode: json['episode'] as bool? ?? false,
      explicit: json['explicit'] as bool? ?? false,
      externalIds: json['externalIds'] == null
          ? null
          : ExternalIds.fromJson(json['externalIds'] as Map<String, dynamic>),
      externalUrls: json['externalUrls'] == null
          ? null
          : ExternalUrls.fromJson(json['externalUrls'] as Map<String, dynamic>),
      href: json['href'] as String? ?? '',
      id: json['id'] as String? ?? '',
      isLocal: json['isLocal'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      popularity: json['popularity'] as int?,
      previewUrl: json['previewUrl'] as String? ?? '',
      track: json['track'] as bool? ?? false,
      trackNumber: json['trackNumber'] as int?,
      type: $enumDecodeNullable(_$TrackTypeEnumMap, json['type']),
      uri: json['uri'] as String? ?? '',
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'album': instance.album,
      'artists': instance.artists,
      'availableMarkets': instance.availableMarkets,
      'discNumber': instance.discNumber,
      'durationMs': instance.durationMs,
      'episode': instance.episode,
      'explicit': instance.explicit,
      'externalIds': instance.externalIds,
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'isLocal': instance.isLocal,
      'name': instance.name,
      'popularity': instance.popularity,
      'previewUrl': instance.previewUrl,
      'track': instance.track,
      'trackNumber': instance.trackNumber,
      'type': _$TrackTypeEnumMap[instance.type],
      'uri': instance.uri,
    };

const _$TrackTypeEnumMap = {
  TrackType.track: 'track',
};

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      albumType: $enumDecodeNullable(_$AlbumTypeEnumEnumMap, json['albumType']),
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => AddedBy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      availableMarkets: (json['availableMarkets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      externalUrls: json['externalUrls'] == null
          ? null
          : ExternalUrls.fromJson(json['externalUrls'] as Map<String, dynamic>),
      href: json['href'] as String? ?? '',
      id: json['id'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? '',
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      releaseDatePrecision: $enumDecodeNullable(
          _$ReleaseDatePrecisionEnumMap, json['releaseDatePrecision']),
      totalTracks: json['totalTracks'] as int?,
      type: $enumDecodeNullable(_$AlbumTypeEnumEnumMap, json['type']),
      uri: json['uri'] as String? ?? '',
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'albumType': _$AlbumTypeEnumEnumMap[instance.albumType],
      'artists': instance.artists,
      'availableMarkets': instance.availableMarkets,
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'releaseDatePrecision':
          _$ReleaseDatePrecisionEnumMap[instance.releaseDatePrecision],
      'totalTracks': instance.totalTracks,
      'type': _$AlbumTypeEnumEnumMap[instance.type],
      'uri': instance.uri,
    };

const _$AlbumTypeEnumEnumMap = {
  AlbumTypeEnum.album: 'album',
  AlbumTypeEnum.compilation: 'compilation',
  AlbumTypeEnum.single: 'single',
};

const _$ReleaseDatePrecisionEnumMap = {
  ReleaseDatePrecision.day: 'day',
};

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      height: json['height'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      width: json['width'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };

_$_ExternalIds _$$_ExternalIdsFromJson(Map<String, dynamic> json) =>
    _$_ExternalIds(
      isrc: json['isrc'] as String? ?? '',
    );

Map<String, dynamic> _$$_ExternalIdsToJson(_$_ExternalIds instance) =>
    <String, dynamic>{
      'isrc': instance.isrc,
    };

_$_VideoThumbnail _$$_VideoThumbnailFromJson(Map<String, dynamic> json) =>
    _$_VideoThumbnail(
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$_VideoThumbnailToJson(_$_VideoThumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
