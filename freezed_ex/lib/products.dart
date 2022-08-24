import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_ex/product.dart';

part 'products.freezed.dart';

part 'products.g.dart';

/// ターミナル
/// コード生成して監視、古い生成ファイルと競合していたら古いファイルを削除
/// """
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// """

@freezed
abstract class Products with _$Products {
  const factory Products({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}
