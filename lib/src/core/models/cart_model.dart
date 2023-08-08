//購物車
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel(
      {@Default(0) int id,
      @Default('') String name,
      @Default(0) int price,
      @Default('') String img,
      @Default(0) int quantity,
      @Default(false) bool isExist,
      String? time,
      @Default({}) dynamic product}) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
