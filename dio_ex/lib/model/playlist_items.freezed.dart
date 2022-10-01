// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'playlist_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaylistItems _$PlaylistItemsFromJson(Map<String, dynamic> json) {
  return _PlaylistItems.fromJson(json);
}

/// @nodoc
mixin _$PlaylistItems {
  String get href => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;
  dynamic get limit => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  dynamic get offset => throw _privateConstructorUsedError;
  dynamic get previous => throw _privateConstructorUsedError;
  dynamic get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistItemsCopyWith<PlaylistItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistItemsCopyWith<$Res> {
  factory $PlaylistItemsCopyWith(
          PlaylistItems value, $Res Function(PlaylistItems) then) =
      _$PlaylistItemsCopyWithImpl<$Res>;
  $Res call(
      {String href,
      List<Item> items,
      dynamic limit,
      dynamic next,
      dynamic offset,
      dynamic previous,
      dynamic total});
}

/// @nodoc
class _$PlaylistItemsCopyWithImpl<$Res>
    implements $PlaylistItemsCopyWith<$Res> {
  _$PlaylistItemsCopyWithImpl(this._value, this._then);

  final PlaylistItems _value;
  // ignore: unused_field
  final $Res Function(PlaylistItems) _then;

  @override
  $Res call({
    Object? href = freezed,
    Object? items = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? offset = freezed,
    Object? previous = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as dynamic,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_PlaylistItemsCopyWith<$Res>
    implements $PlaylistItemsCopyWith<$Res> {
  factory _$$_PlaylistItemsCopyWith(
          _$_PlaylistItems value, $Res Function(_$_PlaylistItems) then) =
      __$$_PlaylistItemsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String href,
      List<Item> items,
      dynamic limit,
      dynamic next,
      dynamic offset,
      dynamic previous,
      dynamic total});
}

/// @nodoc
class __$$_PlaylistItemsCopyWithImpl<$Res>
    extends _$PlaylistItemsCopyWithImpl<$Res>
    implements _$$_PlaylistItemsCopyWith<$Res> {
  __$$_PlaylistItemsCopyWithImpl(
      _$_PlaylistItems _value, $Res Function(_$_PlaylistItems) _then)
      : super(_value, (v) => _then(v as _$_PlaylistItems));

  @override
  _$_PlaylistItems get _value => super._value as _$_PlaylistItems;

  @override
  $Res call({
    Object? href = freezed,
    Object? items = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? offset = freezed,
    Object? previous = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_PlaylistItems(
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      limit: limit == freezed ? _value.limit : limit,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      offset: offset == freezed ? _value.offset : offset,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      total: total == freezed ? _value.total : total,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaylistItems implements _PlaylistItems {
  const _$_PlaylistItems(
      {this.href = '',
      final List<Item> items = const [],
      this.limit = 0,
      this.next,
      this.offset = 0,
      this.previous,
      this.total = 0})
      : _items = items;

  factory _$_PlaylistItems.fromJson(Map<String, dynamic> json) =>
      _$$_PlaylistItemsFromJson(json);

  @override
  @JsonKey()
  final String href;
  final List<Item> _items;
  @override
  @JsonKey()
  List<Item> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final dynamic limit;
  @override
  final dynamic next;
  @override
  @JsonKey()
  final dynamic offset;
  @override
  final dynamic previous;
  @override
  @JsonKey()
  final dynamic total;

  @override
  String toString() {
    return 'PlaylistItems(href: $href, items: $items, limit: $limit, next: $next, offset: $offset, previous: $previous, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistItems &&
            const DeepCollectionEquality().equals(other.href, href) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(href),
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
  _$$_PlaylistItemsCopyWith<_$_PlaylistItems> get copyWith =>
      __$$_PlaylistItemsCopyWithImpl<_$_PlaylistItems>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaylistItemsToJson(
      this,
    );
  }
}

abstract class _PlaylistItems implements PlaylistItems {
  const factory _PlaylistItems(
      {final String href,
      final List<Item> items,
      final dynamic limit,
      final dynamic next,
      final dynamic offset,
      final dynamic previous,
      final dynamic total}) = _$_PlaylistItems;

  factory _PlaylistItems.fromJson(Map<String, dynamic> json) =
      _$_PlaylistItems.fromJson;

  @override
  String get href;
  @override
  List<Item> get items;
  @override
  dynamic get limit;
  @override
  dynamic get next;
  @override
  dynamic get offset;
  @override
  dynamic get previous;
  @override
  dynamic get total;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistItemsCopyWith<_$_PlaylistItems> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  DateTime? get addedAt => throw _privateConstructorUsedError;
  AddedBy? get addedBy => throw _privateConstructorUsedError;
  bool get isLocal => throw _privateConstructorUsedError;
  dynamic get primaryColor => throw _privateConstructorUsedError;
  Track? get track => throw _privateConstructorUsedError;
  VideoThumbnail? get videoThumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {DateTime? addedAt,
      AddedBy? addedBy,
      bool isLocal,
      dynamic primaryColor,
      Track? track,
      VideoThumbnail? videoThumbnail});

  $AddedByCopyWith<$Res>? get addedBy;
  $TrackCopyWith<$Res>? get track;
  $VideoThumbnailCopyWith<$Res>? get videoThumbnail;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? addedAt = freezed,
    Object? addedBy = freezed,
    Object? isLocal = freezed,
    Object? primaryColor = freezed,
    Object? track = freezed,
    Object? videoThumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      addedAt: addedAt == freezed
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as AddedBy?,
      isLocal: isLocal == freezed
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as Track?,
      videoThumbnail: videoThumbnail == freezed
          ? _value.videoThumbnail
          : videoThumbnail // ignore: cast_nullable_to_non_nullable
              as VideoThumbnail?,
    ));
  }

  @override
  $AddedByCopyWith<$Res>? get addedBy {
    if (_value.addedBy == null) {
      return null;
    }

    return $AddedByCopyWith<$Res>(_value.addedBy!, (value) {
      return _then(_value.copyWith(addedBy: value));
    });
  }

  @override
  $TrackCopyWith<$Res>? get track {
    if (_value.track == null) {
      return null;
    }

    return $TrackCopyWith<$Res>(_value.track!, (value) {
      return _then(_value.copyWith(track: value));
    });
  }

  @override
  $VideoThumbnailCopyWith<$Res>? get videoThumbnail {
    if (_value.videoThumbnail == null) {
      return null;
    }

    return $VideoThumbnailCopyWith<$Res>(_value.videoThumbnail!, (value) {
      return _then(_value.copyWith(videoThumbnail: value));
    });
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? addedAt,
      AddedBy? addedBy,
      bool isLocal,
      dynamic primaryColor,
      Track? track,
      VideoThumbnail? videoThumbnail});

  @override
  $AddedByCopyWith<$Res>? get addedBy;
  @override
  $TrackCopyWith<$Res>? get track;
  @override
  $VideoThumbnailCopyWith<$Res>? get videoThumbnail;
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, (v) => _then(v as _$_Item));

  @override
  _$_Item get _value => super._value as _$_Item;

  @override
  $Res call({
    Object? addedAt = freezed,
    Object? addedBy = freezed,
    Object? isLocal = freezed,
    Object? primaryColor = freezed,
    Object? track = freezed,
    Object? videoThumbnail = freezed,
  }) {
    return _then(_$_Item(
      addedAt: addedAt == freezed
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as AddedBy?,
      isLocal: isLocal == freezed
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as Track?,
      videoThumbnail: videoThumbnail == freezed
          ? _value.videoThumbnail
          : videoThumbnail // ignore: cast_nullable_to_non_nullable
              as VideoThumbnail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {this.addedAt,
      this.addedBy,
      this.isLocal = false,
      this.primaryColor,
      this.track,
      this.videoThumbnail});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final DateTime? addedAt;
  @override
  final AddedBy? addedBy;
  @override
  @JsonKey()
  final bool isLocal;
  @override
  final dynamic primaryColor;
  @override
  final Track? track;
  @override
  final VideoThumbnail? videoThumbnail;

  @override
  String toString() {
    return 'Item(addedAt: $addedAt, addedBy: $addedBy, isLocal: $isLocal, primaryColor: $primaryColor, track: $track, videoThumbnail: $videoThumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            const DeepCollectionEquality().equals(other.addedAt, addedAt) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.isLocal, isLocal) &&
            const DeepCollectionEquality()
                .equals(other.primaryColor, primaryColor) &&
            const DeepCollectionEquality().equals(other.track, track) &&
            const DeepCollectionEquality()
                .equals(other.videoThumbnail, videoThumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(addedAt),
      const DeepCollectionEquality().hash(addedBy),
      const DeepCollectionEquality().hash(isLocal),
      const DeepCollectionEquality().hash(primaryColor),
      const DeepCollectionEquality().hash(track),
      const DeepCollectionEquality().hash(videoThumbnail));

  @JsonKey(ignore: true)
  @override
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final DateTime? addedAt,
      final AddedBy? addedBy,
      final bool isLocal,
      final dynamic primaryColor,
      final Track? track,
      final VideoThumbnail? videoThumbnail}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  DateTime? get addedAt;
  @override
  AddedBy? get addedBy;
  @override
  bool get isLocal;
  @override
  dynamic get primaryColor;
  @override
  Track? get track;
  @override
  VideoThumbnail? get videoThumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}

AddedBy _$AddedByFromJson(Map<String, dynamic> json) {
  return _AddedBy.fromJson(json);
}

/// @nodoc
mixin _$AddedBy {
  ExternalUrls? get externalUrls => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  AddedByType? get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddedByCopyWith<AddedBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddedByCopyWith<$Res> {
  factory $AddedByCopyWith(AddedBy value, $Res Function(AddedBy) then) =
      _$AddedByCopyWithImpl<$Res>;
  $Res call(
      {ExternalUrls? externalUrls,
      String href,
      String id,
      AddedByType? type,
      String uri,
      String name});

  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class _$AddedByCopyWithImpl<$Res> implements $AddedByCopyWith<$Res> {
  _$AddedByCopyWithImpl(this._value, this._then);

  final AddedBy _value;
  // ignore: unused_field
  final $Res Function(AddedBy) _then;

  @override
  $Res call({
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? uri = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      externalUrls: externalUrls == freezed
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddedByType?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls {
    if (_value.externalUrls == null) {
      return null;
    }

    return $ExternalUrlsCopyWith<$Res>(_value.externalUrls!, (value) {
      return _then(_value.copyWith(externalUrls: value));
    });
  }
}

/// @nodoc
abstract class _$$_AddedByCopyWith<$Res> implements $AddedByCopyWith<$Res> {
  factory _$$_AddedByCopyWith(
          _$_AddedBy value, $Res Function(_$_AddedBy) then) =
      __$$_AddedByCopyWithImpl<$Res>;
  @override
  $Res call(
      {ExternalUrls? externalUrls,
      String href,
      String id,
      AddedByType? type,
      String uri,
      String name});

  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class __$$_AddedByCopyWithImpl<$Res> extends _$AddedByCopyWithImpl<$Res>
    implements _$$_AddedByCopyWith<$Res> {
  __$$_AddedByCopyWithImpl(_$_AddedBy _value, $Res Function(_$_AddedBy) _then)
      : super(_value, (v) => _then(v as _$_AddedBy));

  @override
  _$_AddedBy get _value => super._value as _$_AddedBy;

  @override
  $Res call({
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? uri = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_AddedBy(
      externalUrls: externalUrls == freezed
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddedByType?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddedBy implements _AddedBy {
  const _$_AddedBy(
      {this.externalUrls,
      this.href = '',
      this.id = '',
      this.type,
      this.uri = '',
      this.name = ''});

  factory _$_AddedBy.fromJson(Map<String, dynamic> json) =>
      _$$_AddedByFromJson(json);

  @override
  final ExternalUrls? externalUrls;
  @override
  @JsonKey()
  final String href;
  @override
  @JsonKey()
  final String id;
  @override
  final AddedByType? type;
  @override
  @JsonKey()
  final String uri;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'AddedBy(externalUrls: $externalUrls, href: $href, id: $id, type: $type, uri: $uri, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddedBy &&
            const DeepCollectionEquality()
                .equals(other.externalUrls, externalUrls) &&
            const DeepCollectionEquality().equals(other.href, href) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.uri, uri) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(externalUrls),
      const DeepCollectionEquality().hash(href),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(uri),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_AddedByCopyWith<_$_AddedBy> get copyWith =>
      __$$_AddedByCopyWithImpl<_$_AddedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddedByToJson(
      this,
    );
  }
}

abstract class _AddedBy implements AddedBy {
  const factory _AddedBy(
      {final ExternalUrls? externalUrls,
      final String href,
      final String id,
      final AddedByType? type,
      final String uri,
      final String name}) = _$_AddedBy;

  factory _AddedBy.fromJson(Map<String, dynamic> json) = _$_AddedBy.fromJson;

  @override
  ExternalUrls? get externalUrls;
  @override
  String get href;
  @override
  String get id;
  @override
  AddedByType? get type;
  @override
  String get uri;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_AddedByCopyWith<_$_AddedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

ExternalUrls _$ExternalUrlsFromJson(Map<String, dynamic> json) {
  return _ExternalUrls.fromJson(json);
}

/// @nodoc
mixin _$ExternalUrls {
  String get spotify => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExternalUrlsCopyWith<ExternalUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalUrlsCopyWith<$Res> {
  factory $ExternalUrlsCopyWith(
          ExternalUrls value, $Res Function(ExternalUrls) then) =
      _$ExternalUrlsCopyWithImpl<$Res>;
  $Res call({String spotify});
}

/// @nodoc
class _$ExternalUrlsCopyWithImpl<$Res> implements $ExternalUrlsCopyWith<$Res> {
  _$ExternalUrlsCopyWithImpl(this._value, this._then);

  final ExternalUrls _value;
  // ignore: unused_field
  final $Res Function(ExternalUrls) _then;

  @override
  $Res call({
    Object? spotify = freezed,
  }) {
    return _then(_value.copyWith(
      spotify: spotify == freezed
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ExternalUrlsCopyWith<$Res>
    implements $ExternalUrlsCopyWith<$Res> {
  factory _$$_ExternalUrlsCopyWith(
          _$_ExternalUrls value, $Res Function(_$_ExternalUrls) then) =
      __$$_ExternalUrlsCopyWithImpl<$Res>;
  @override
  $Res call({String spotify});
}

/// @nodoc
class __$$_ExternalUrlsCopyWithImpl<$Res>
    extends _$ExternalUrlsCopyWithImpl<$Res>
    implements _$$_ExternalUrlsCopyWith<$Res> {
  __$$_ExternalUrlsCopyWithImpl(
      _$_ExternalUrls _value, $Res Function(_$_ExternalUrls) _then)
      : super(_value, (v) => _then(v as _$_ExternalUrls));

  @override
  _$_ExternalUrls get _value => super._value as _$_ExternalUrls;

  @override
  $Res call({
    Object? spotify = freezed,
  }) {
    return _then(_$_ExternalUrls(
      spotify: spotify == freezed
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExternalUrls implements _ExternalUrls {
  const _$_ExternalUrls({this.spotify = ''});

  factory _$_ExternalUrls.fromJson(Map<String, dynamic> json) =>
      _$$_ExternalUrlsFromJson(json);

  @override
  @JsonKey()
  final String spotify;

  @override
  String toString() {
    return 'ExternalUrls(spotify: $spotify)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExternalUrls &&
            const DeepCollectionEquality().equals(other.spotify, spotify));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(spotify));

  @JsonKey(ignore: true)
  @override
  _$$_ExternalUrlsCopyWith<_$_ExternalUrls> get copyWith =>
      __$$_ExternalUrlsCopyWithImpl<_$_ExternalUrls>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExternalUrlsToJson(
      this,
    );
  }
}

abstract class _ExternalUrls implements ExternalUrls {
  const factory _ExternalUrls({final String spotify}) = _$_ExternalUrls;

  factory _ExternalUrls.fromJson(Map<String, dynamic> json) =
      _$_ExternalUrls.fromJson;

  @override
  String get spotify;
  @override
  @JsonKey(ignore: true)
  _$$_ExternalUrlsCopyWith<_$_ExternalUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  Album? get album => throw _privateConstructorUsedError;
  List<AddedBy> get artists => throw _privateConstructorUsedError;
  List<String> get availableMarkets => throw _privateConstructorUsedError;
  int? get discNumber => throw _privateConstructorUsedError;
  int? get durationMs => throw _privateConstructorUsedError;
  bool get episode => throw _privateConstructorUsedError;
  bool get explicit => throw _privateConstructorUsedError;
  ExternalIds? get externalIds => throw _privateConstructorUsedError;
  ExternalUrls? get externalUrls => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get isLocal => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get popularity => throw _privateConstructorUsedError;
  String get previewUrl => throw _privateConstructorUsedError;
  bool get track => throw _privateConstructorUsedError;
  int? get trackNumber => throw _privateConstructorUsedError;
  TrackType? get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res>;
  $Res call(
      {Album? album,
      List<AddedBy> artists,
      List<String> availableMarkets,
      int? discNumber,
      int? durationMs,
      bool episode,
      bool explicit,
      ExternalIds? externalIds,
      ExternalUrls? externalUrls,
      String href,
      String id,
      bool isLocal,
      String name,
      int? popularity,
      String previewUrl,
      bool track,
      int? trackNumber,
      TrackType? type,
      String uri});

  $AlbumCopyWith<$Res>? get album;
  $ExternalIdsCopyWith<$Res>? get externalIds;
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class _$TrackCopyWithImpl<$Res> implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  final Track _value;
  // ignore: unused_field
  final $Res Function(Track) _then;

  @override
  $Res call({
    Object? album = freezed,
    Object? artists = freezed,
    Object? availableMarkets = freezed,
    Object? discNumber = freezed,
    Object? durationMs = freezed,
    Object? episode = freezed,
    Object? explicit = freezed,
    Object? externalIds = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? isLocal = freezed,
    Object? name = freezed,
    Object? popularity = freezed,
    Object? previewUrl = freezed,
    Object? track = freezed,
    Object? trackNumber = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      album: album == freezed
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as Album?,
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<AddedBy>,
      availableMarkets: availableMarkets == freezed
          ? _value.availableMarkets
          : availableMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      discNumber: discNumber == freezed
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMs: durationMs == freezed
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as bool,
      explicit: explicit == freezed
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool,
      externalIds: externalIds == freezed
          ? _value.externalIds
          : externalIds // ignore: cast_nullable_to_non_nullable
              as ExternalIds?,
      externalUrls: externalUrls == freezed
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isLocal: isLocal == freezed
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
      previewUrl: previewUrl == freezed
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as bool,
      trackNumber: trackNumber == freezed
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TrackType?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $AlbumCopyWith<$Res>? get album {
    if (_value.album == null) {
      return null;
    }

    return $AlbumCopyWith<$Res>(_value.album!, (value) {
      return _then(_value.copyWith(album: value));
    });
  }

  @override
  $ExternalIdsCopyWith<$Res>? get externalIds {
    if (_value.externalIds == null) {
      return null;
    }

    return $ExternalIdsCopyWith<$Res>(_value.externalIds!, (value) {
      return _then(_value.copyWith(externalIds: value));
    });
  }

  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls {
    if (_value.externalUrls == null) {
      return null;
    }

    return $ExternalUrlsCopyWith<$Res>(_value.externalUrls!, (value) {
      return _then(_value.copyWith(externalUrls: value));
    });
  }
}

/// @nodoc
abstract class _$$_TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$_TrackCopyWith(_$_Track value, $Res Function(_$_Track) then) =
      __$$_TrackCopyWithImpl<$Res>;
  @override
  $Res call(
      {Album? album,
      List<AddedBy> artists,
      List<String> availableMarkets,
      int? discNumber,
      int? durationMs,
      bool episode,
      bool explicit,
      ExternalIds? externalIds,
      ExternalUrls? externalUrls,
      String href,
      String id,
      bool isLocal,
      String name,
      int? popularity,
      String previewUrl,
      bool track,
      int? trackNumber,
      TrackType? type,
      String uri});

  @override
  $AlbumCopyWith<$Res>? get album;
  @override
  $ExternalIdsCopyWith<$Res>? get externalIds;
  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class __$$_TrackCopyWithImpl<$Res> extends _$TrackCopyWithImpl<$Res>
    implements _$$_TrackCopyWith<$Res> {
  __$$_TrackCopyWithImpl(_$_Track _value, $Res Function(_$_Track) _then)
      : super(_value, (v) => _then(v as _$_Track));

  @override
  _$_Track get _value => super._value as _$_Track;

  @override
  $Res call({
    Object? album = freezed,
    Object? artists = freezed,
    Object? availableMarkets = freezed,
    Object? discNumber = freezed,
    Object? durationMs = freezed,
    Object? episode = freezed,
    Object? explicit = freezed,
    Object? externalIds = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? isLocal = freezed,
    Object? name = freezed,
    Object? popularity = freezed,
    Object? previewUrl = freezed,
    Object? track = freezed,
    Object? trackNumber = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_$_Track(
      album: album == freezed
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as Album?,
      artists: artists == freezed
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<AddedBy>,
      availableMarkets: availableMarkets == freezed
          ? _value._availableMarkets
          : availableMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      discNumber: discNumber == freezed
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMs: durationMs == freezed
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as bool,
      explicit: explicit == freezed
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool,
      externalIds: externalIds == freezed
          ? _value.externalIds
          : externalIds // ignore: cast_nullable_to_non_nullable
              as ExternalIds?,
      externalUrls: externalUrls == freezed
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isLocal: isLocal == freezed
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
      previewUrl: previewUrl == freezed
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as bool,
      trackNumber: trackNumber == freezed
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TrackType?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Track implements _Track {
  const _$_Track(
      {this.album,
      final List<AddedBy> artists = const [],
      final List<String> availableMarkets = const [],
      this.discNumber,
      this.durationMs,
      this.episode = false,
      this.explicit = false,
      this.externalIds,
      this.externalUrls,
      this.href = '',
      this.id = '',
      this.isLocal = false,
      this.name = '',
      this.popularity,
      this.previewUrl = '',
      this.track = false,
      this.trackNumber,
      this.type,
      this.uri = ''})
      : _artists = artists,
        _availableMarkets = availableMarkets;

  factory _$_Track.fromJson(Map<String, dynamic> json) =>
      _$$_TrackFromJson(json);

  @override
  final Album? album;
  final List<AddedBy> _artists;
  @override
  @JsonKey()
  List<AddedBy> get artists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<String> _availableMarkets;
  @override
  @JsonKey()
  List<String> get availableMarkets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableMarkets);
  }

  @override
  final int? discNumber;
  @override
  final int? durationMs;
  @override
  @JsonKey()
  final bool episode;
  @override
  @JsonKey()
  final bool explicit;
  @override
  final ExternalIds? externalIds;
  @override
  final ExternalUrls? externalUrls;
  @override
  @JsonKey()
  final String href;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool isLocal;
  @override
  @JsonKey()
  final String name;
  @override
  final int? popularity;
  @override
  @JsonKey()
  final String previewUrl;
  @override
  @JsonKey()
  final bool track;
  @override
  final int? trackNumber;
  @override
  final TrackType? type;
  @override
  @JsonKey()
  final String uri;

  @override
  String toString() {
    return 'Track(album: $album, artists: $artists, availableMarkets: $availableMarkets, discNumber: $discNumber, durationMs: $durationMs, episode: $episode, explicit: $explicit, externalIds: $externalIds, externalUrls: $externalUrls, href: $href, id: $id, isLocal: $isLocal, name: $name, popularity: $popularity, previewUrl: $previewUrl, track: $track, trackNumber: $trackNumber, type: $type, uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Track &&
            const DeepCollectionEquality().equals(other.album, album) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality()
                .equals(other._availableMarkets, _availableMarkets) &&
            const DeepCollectionEquality()
                .equals(other.discNumber, discNumber) &&
            const DeepCollectionEquality()
                .equals(other.durationMs, durationMs) &&
            const DeepCollectionEquality().equals(other.episode, episode) &&
            const DeepCollectionEquality().equals(other.explicit, explicit) &&
            const DeepCollectionEquality()
                .equals(other.externalIds, externalIds) &&
            const DeepCollectionEquality()
                .equals(other.externalUrls, externalUrls) &&
            const DeepCollectionEquality().equals(other.href, href) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.isLocal, isLocal) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.popularity, popularity) &&
            const DeepCollectionEquality()
                .equals(other.previewUrl, previewUrl) &&
            const DeepCollectionEquality().equals(other.track, track) &&
            const DeepCollectionEquality()
                .equals(other.trackNumber, trackNumber) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.uri, uri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(album),
        const DeepCollectionEquality().hash(_artists),
        const DeepCollectionEquality().hash(_availableMarkets),
        const DeepCollectionEquality().hash(discNumber),
        const DeepCollectionEquality().hash(durationMs),
        const DeepCollectionEquality().hash(episode),
        const DeepCollectionEquality().hash(explicit),
        const DeepCollectionEquality().hash(externalIds),
        const DeepCollectionEquality().hash(externalUrls),
        const DeepCollectionEquality().hash(href),
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(isLocal),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(popularity),
        const DeepCollectionEquality().hash(previewUrl),
        const DeepCollectionEquality().hash(track),
        const DeepCollectionEquality().hash(trackNumber),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(uri)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      __$$_TrackCopyWithImpl<_$_Track>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrackToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  const factory _Track(
      {final Album? album,
      final List<AddedBy> artists,
      final List<String> availableMarkets,
      final int? discNumber,
      final int? durationMs,
      final bool episode,
      final bool explicit,
      final ExternalIds? externalIds,
      final ExternalUrls? externalUrls,
      final String href,
      final String id,
      final bool isLocal,
      final String name,
      final int? popularity,
      final String previewUrl,
      final bool track,
      final int? trackNumber,
      final TrackType? type,
      final String uri}) = _$_Track;

  factory _Track.fromJson(Map<String, dynamic> json) = _$_Track.fromJson;

  @override
  Album? get album;
  @override
  List<AddedBy> get artists;
  @override
  List<String> get availableMarkets;
  @override
  int? get discNumber;
  @override
  int? get durationMs;
  @override
  bool get episode;
  @override
  bool get explicit;
  @override
  ExternalIds? get externalIds;
  @override
  ExternalUrls? get externalUrls;
  @override
  String get href;
  @override
  String get id;
  @override
  bool get isLocal;
  @override
  String get name;
  @override
  int? get popularity;
  @override
  String get previewUrl;
  @override
  bool get track;
  @override
  int? get trackNumber;
  @override
  TrackType? get type;
  @override
  String get uri;
  @override
  @JsonKey(ignore: true)
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      throw _privateConstructorUsedError;
}

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
mixin _$Album {
  AlbumTypeEnum? get albumType => throw _privateConstructorUsedError;
  List<AddedBy> get artists => throw _privateConstructorUsedError;
  List<String> get availableMarkets => throw _privateConstructorUsedError;
  ExternalUrls? get externalUrls => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<Image> get images => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  ReleaseDatePrecision? get releaseDatePrecision =>
      throw _privateConstructorUsedError;
  int? get totalTracks => throw _privateConstructorUsedError;
  AlbumTypeEnum? get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res>;
  $Res call(
      {AlbumTypeEnum? albumType,
      List<AddedBy> artists,
      List<String> availableMarkets,
      ExternalUrls? externalUrls,
      String href,
      String id,
      List<Image> images,
      String name,
      DateTime? releaseDate,
      ReleaseDatePrecision? releaseDatePrecision,
      int? totalTracks,
      AlbumTypeEnum? type,
      String uri});

  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res> implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  final Album _value;
  // ignore: unused_field
  final $Res Function(Album) _then;

  @override
  $Res call({
    Object? albumType = freezed,
    Object? artists = freezed,
    Object? availableMarkets = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? releaseDate = freezed,
    Object? releaseDatePrecision = freezed,
    Object? totalTracks = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      albumType: albumType == freezed
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as AlbumTypeEnum?,
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<AddedBy>,
      availableMarkets: availableMarkets == freezed
          ? _value.availableMarkets
          : availableMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      externalUrls: externalUrls == freezed
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseDatePrecision: releaseDatePrecision == freezed
          ? _value.releaseDatePrecision
          : releaseDatePrecision // ignore: cast_nullable_to_non_nullable
              as ReleaseDatePrecision?,
      totalTracks: totalTracks == freezed
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlbumTypeEnum?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls {
    if (_value.externalUrls == null) {
      return null;
    }

    return $ExternalUrlsCopyWith<$Res>(_value.externalUrls!, (value) {
      return _then(_value.copyWith(externalUrls: value));
    });
  }
}

/// @nodoc
abstract class _$$_AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$_AlbumCopyWith(_$_Album value, $Res Function(_$_Album) then) =
      __$$_AlbumCopyWithImpl<$Res>;
  @override
  $Res call(
      {AlbumTypeEnum? albumType,
      List<AddedBy> artists,
      List<String> availableMarkets,
      ExternalUrls? externalUrls,
      String href,
      String id,
      List<Image> images,
      String name,
      DateTime? releaseDate,
      ReleaseDatePrecision? releaseDatePrecision,
      int? totalTracks,
      AlbumTypeEnum? type,
      String uri});

  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class __$$_AlbumCopyWithImpl<$Res> extends _$AlbumCopyWithImpl<$Res>
    implements _$$_AlbumCopyWith<$Res> {
  __$$_AlbumCopyWithImpl(_$_Album _value, $Res Function(_$_Album) _then)
      : super(_value, (v) => _then(v as _$_Album));

  @override
  _$_Album get _value => super._value as _$_Album;

  @override
  $Res call({
    Object? albumType = freezed,
    Object? artists = freezed,
    Object? availableMarkets = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? releaseDate = freezed,
    Object? releaseDatePrecision = freezed,
    Object? totalTracks = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_$_Album(
      albumType: albumType == freezed
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as AlbumTypeEnum?,
      artists: artists == freezed
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<AddedBy>,
      availableMarkets: availableMarkets == freezed
          ? _value._availableMarkets
          : availableMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      externalUrls: externalUrls == freezed
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseDatePrecision: releaseDatePrecision == freezed
          ? _value.releaseDatePrecision
          : releaseDatePrecision // ignore: cast_nullable_to_non_nullable
              as ReleaseDatePrecision?,
      totalTracks: totalTracks == freezed
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlbumTypeEnum?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Album implements _Album {
  const _$_Album(
      {this.albumType,
      final List<AddedBy> artists = const [],
      final List<String> availableMarkets = const [],
      this.externalUrls,
      this.href = '',
      this.id = '',
      final List<Image> images = const [],
      this.name = '',
      this.releaseDate,
      this.releaseDatePrecision,
      this.totalTracks,
      this.type,
      this.uri = ''})
      : _artists = artists,
        _availableMarkets = availableMarkets,
        _images = images;

  factory _$_Album.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumFromJson(json);

  @override
  final AlbumTypeEnum? albumType;
  final List<AddedBy> _artists;
  @override
  @JsonKey()
  List<AddedBy> get artists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<String> _availableMarkets;
  @override
  @JsonKey()
  List<String> get availableMarkets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableMarkets);
  }

  @override
  final ExternalUrls? externalUrls;
  @override
  @JsonKey()
  final String href;
  @override
  @JsonKey()
  final String id;
  final List<Image> _images;
  @override
  @JsonKey()
  List<Image> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final String name;
  @override
  final DateTime? releaseDate;
  @override
  final ReleaseDatePrecision? releaseDatePrecision;
  @override
  final int? totalTracks;
  @override
  final AlbumTypeEnum? type;
  @override
  @JsonKey()
  final String uri;

  @override
  String toString() {
    return 'Album(albumType: $albumType, artists: $artists, availableMarkets: $availableMarkets, externalUrls: $externalUrls, href: $href, id: $id, images: $images, name: $name, releaseDate: $releaseDate, releaseDatePrecision: $releaseDatePrecision, totalTracks: $totalTracks, type: $type, uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Album &&
            const DeepCollectionEquality().equals(other.albumType, albumType) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality()
                .equals(other._availableMarkets, _availableMarkets) &&
            const DeepCollectionEquality()
                .equals(other.externalUrls, externalUrls) &&
            const DeepCollectionEquality().equals(other.href, href) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.releaseDate, releaseDate) &&
            const DeepCollectionEquality()
                .equals(other.releaseDatePrecision, releaseDatePrecision) &&
            const DeepCollectionEquality()
                .equals(other.totalTracks, totalTracks) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.uri, uri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(albumType),
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_availableMarkets),
      const DeepCollectionEquality().hash(externalUrls),
      const DeepCollectionEquality().hash(href),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(releaseDate),
      const DeepCollectionEquality().hash(releaseDatePrecision),
      const DeepCollectionEquality().hash(totalTracks),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(uri));

  @JsonKey(ignore: true)
  @override
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      __$$_AlbumCopyWithImpl<_$_Album>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumToJson(
      this,
    );
  }
}

abstract class _Album implements Album {
  const factory _Album(
      {final AlbumTypeEnum? albumType,
      final List<AddedBy> artists,
      final List<String> availableMarkets,
      final ExternalUrls? externalUrls,
      final String href,
      final String id,
      final List<Image> images,
      final String name,
      final DateTime? releaseDate,
      final ReleaseDatePrecision? releaseDatePrecision,
      final int? totalTracks,
      final AlbumTypeEnum? type,
      final String uri}) = _$_Album;

  factory _Album.fromJson(Map<String, dynamic> json) = _$_Album.fromJson;

  @override
  AlbumTypeEnum? get albumType;
  @override
  List<AddedBy> get artists;
  @override
  List<String> get availableMarkets;
  @override
  ExternalUrls? get externalUrls;
  @override
  String get href;
  @override
  String get id;
  @override
  List<Image> get images;
  @override
  String get name;
  @override
  DateTime? get releaseDate;
  @override
  ReleaseDatePrecision? get releaseDatePrecision;
  @override
  int? get totalTracks;
  @override
  AlbumTypeEnum? get type;
  @override
  String get uri;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  int get height => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res>;
  $Res call({int height, String url, int width});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res> implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  final Image _value;
  // ignore: unused_field
  final $Res Function(Image) _then;

  @override
  $Res call({
    Object? height = freezed,
    Object? url = freezed,
    Object? width = freezed,
  }) {
    return _then(_value.copyWith(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @override
  $Res call({int height, String url, int width});
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, (v) => _then(v as _$_Image));

  @override
  _$_Image get _value => super._value as _$_Image;

  @override
  $Res call({
    Object? height = freezed,
    Object? url = freezed,
    Object? width = freezed,
  }) {
    return _then(_$_Image(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Image implements _Image {
  const _$_Image({this.height = 0, this.url = '', this.width = 0});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final int width;

  @override
  String toString() {
    return 'Image(height: $height, url: $url, width: $width)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.width, width));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(width));

  @JsonKey(ignore: true)
  @override
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      __$$_ImageCopyWithImpl<_$_Image>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  const factory _Image({final int height, final String url, final int width}) =
      _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  int get height;
  @override
  String get url;
  @override
  int get width;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      throw _privateConstructorUsedError;
}

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) {
  return _ExternalIds.fromJson(json);
}

/// @nodoc
mixin _$ExternalIds {
  String get isrc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExternalIdsCopyWith<ExternalIds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalIdsCopyWith<$Res> {
  factory $ExternalIdsCopyWith(
          ExternalIds value, $Res Function(ExternalIds) then) =
      _$ExternalIdsCopyWithImpl<$Res>;
  $Res call({String isrc});
}

/// @nodoc
class _$ExternalIdsCopyWithImpl<$Res> implements $ExternalIdsCopyWith<$Res> {
  _$ExternalIdsCopyWithImpl(this._value, this._then);

  final ExternalIds _value;
  // ignore: unused_field
  final $Res Function(ExternalIds) _then;

  @override
  $Res call({
    Object? isrc = freezed,
  }) {
    return _then(_value.copyWith(
      isrc: isrc == freezed
          ? _value.isrc
          : isrc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ExternalIdsCopyWith<$Res>
    implements $ExternalIdsCopyWith<$Res> {
  factory _$$_ExternalIdsCopyWith(
          _$_ExternalIds value, $Res Function(_$_ExternalIds) then) =
      __$$_ExternalIdsCopyWithImpl<$Res>;
  @override
  $Res call({String isrc});
}

/// @nodoc
class __$$_ExternalIdsCopyWithImpl<$Res> extends _$ExternalIdsCopyWithImpl<$Res>
    implements _$$_ExternalIdsCopyWith<$Res> {
  __$$_ExternalIdsCopyWithImpl(
      _$_ExternalIds _value, $Res Function(_$_ExternalIds) _then)
      : super(_value, (v) => _then(v as _$_ExternalIds));

  @override
  _$_ExternalIds get _value => super._value as _$_ExternalIds;

  @override
  $Res call({
    Object? isrc = freezed,
  }) {
    return _then(_$_ExternalIds(
      isrc: isrc == freezed
          ? _value.isrc
          : isrc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExternalIds implements _ExternalIds {
  const _$_ExternalIds({this.isrc = ''});

  factory _$_ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$$_ExternalIdsFromJson(json);

  @override
  @JsonKey()
  final String isrc;

  @override
  String toString() {
    return 'ExternalIds(isrc: $isrc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExternalIds &&
            const DeepCollectionEquality().equals(other.isrc, isrc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isrc));

  @JsonKey(ignore: true)
  @override
  _$$_ExternalIdsCopyWith<_$_ExternalIds> get copyWith =>
      __$$_ExternalIdsCopyWithImpl<_$_ExternalIds>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExternalIdsToJson(
      this,
    );
  }
}

abstract class _ExternalIds implements ExternalIds {
  const factory _ExternalIds({final String isrc}) = _$_ExternalIds;

  factory _ExternalIds.fromJson(Map<String, dynamic> json) =
      _$_ExternalIds.fromJson;

  @override
  String get isrc;
  @override
  @JsonKey(ignore: true)
  _$$_ExternalIdsCopyWith<_$_ExternalIds> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoThumbnail _$VideoThumbnailFromJson(Map<String, dynamic> json) {
  return _VideoThumbnail.fromJson(json);
}

/// @nodoc
mixin _$VideoThumbnail {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoThumbnailCopyWith<VideoThumbnail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoThumbnailCopyWith<$Res> {
  factory $VideoThumbnailCopyWith(
          VideoThumbnail value, $Res Function(VideoThumbnail) then) =
      _$VideoThumbnailCopyWithImpl<$Res>;
  $Res call({String url});
}

/// @nodoc
class _$VideoThumbnailCopyWithImpl<$Res>
    implements $VideoThumbnailCopyWith<$Res> {
  _$VideoThumbnailCopyWithImpl(this._value, this._then);

  final VideoThumbnail _value;
  // ignore: unused_field
  final $Res Function(VideoThumbnail) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_VideoThumbnailCopyWith<$Res>
    implements $VideoThumbnailCopyWith<$Res> {
  factory _$$_VideoThumbnailCopyWith(
          _$_VideoThumbnail value, $Res Function(_$_VideoThumbnail) then) =
      __$$_VideoThumbnailCopyWithImpl<$Res>;
  @override
  $Res call({String url});
}

/// @nodoc
class __$$_VideoThumbnailCopyWithImpl<$Res>
    extends _$VideoThumbnailCopyWithImpl<$Res>
    implements _$$_VideoThumbnailCopyWith<$Res> {
  __$$_VideoThumbnailCopyWithImpl(
      _$_VideoThumbnail _value, $Res Function(_$_VideoThumbnail) _then)
      : super(_value, (v) => _then(v as _$_VideoThumbnail));

  @override
  _$_VideoThumbnail get _value => super._value as _$_VideoThumbnail;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$_VideoThumbnail(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoThumbnail implements _VideoThumbnail {
  const _$_VideoThumbnail({this.url = ''});

  factory _$_VideoThumbnail.fromJson(Map<String, dynamic> json) =>
      _$$_VideoThumbnailFromJson(json);

  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'VideoThumbnail(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoThumbnail &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_VideoThumbnailCopyWith<_$_VideoThumbnail> get copyWith =>
      __$$_VideoThumbnailCopyWithImpl<_$_VideoThumbnail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoThumbnailToJson(
      this,
    );
  }
}

abstract class _VideoThumbnail implements VideoThumbnail {
  const factory _VideoThumbnail({final String url}) = _$_VideoThumbnail;

  factory _VideoThumbnail.fromJson(Map<String, dynamic> json) =
      _$_VideoThumbnail.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_VideoThumbnailCopyWith<_$_VideoThumbnail> get copyWith =>
      throw _privateConstructorUsedError;
}
