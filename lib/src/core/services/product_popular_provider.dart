import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/services/api/bslmeiyu_api.dart';

part 'product_popular_provider.freezed.dart';

@freezed
abstract class ProductState with _$ProductState {
  factory ProductState({
    Product? product,
    @Default(true) bool isLoading,
  }) = _ProductState;
}

final productPopularProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
        (ref) => ProductNotifier());

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState()) {
    print('初始化 ProductNotifier');
  }

  loadProductPopular() async {
    state = state.copyWith(isLoading: true);
    final product = await BslmeiyuService().productPopular();

    state = state.copyWith(product: product, isLoading: false);
  }
}
