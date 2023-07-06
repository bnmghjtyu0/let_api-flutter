// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_api_flutter/src/models/cart_model.dart';
part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  factory CartState(
      {required Map<int, CartModel> data,
      required int quantity,
      required int totalItems}) = _CartState;
}
