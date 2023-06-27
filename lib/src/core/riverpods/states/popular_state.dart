// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.
import 'package:flutter/foundation.dart';
import 'package:let_api_flutter/src/core/models/cart_model.dart';

@immutable
class PopularState {
  final Map<int, CartModel> data;
  final int quantity;

  const PopularState({required this.data, required this.quantity});

  PopularState copyWith({Map<int, CartModel>? data, required int quantity}) {
    return PopularState(data: this.data, quantity: this.quantity);
  }
}
