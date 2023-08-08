import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.freezed.dart';
part 'products_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product(
      {int? totalSize,
      int? typeId,
      int? offset,
      required List<ProductModel> products}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel(
      {int? id,
      String? name,
      String? description,
      int? price,
      int? stars,
      String? img,
      String? location,
      String? createdAt,
      String? updatedAt,
      int? typeId}) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
