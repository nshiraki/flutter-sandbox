import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_ex/product.dart';

part 'products.freezed.dart';

part 'products.g.dart';

/// NOTE: ターミナルで以下のコマンドを実行すると自動的に @freezed を見つけ出して、コード生成してくれます
/// '''
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// '''

@freezed
class Products with _$Products {
  const factory Products({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}
