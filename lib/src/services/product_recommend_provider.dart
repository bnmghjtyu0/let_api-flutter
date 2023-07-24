import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_api_flutter/src/models/recommend_model.dart';
import 'package:let_api_flutter/src/services/api/bslmeiyu_api.dart';
part 'product_recommend_provider.freezed.dart';

@freezed
abstract class ProductRecommendState with _$ProductRecommendState {
  factory ProductRecommendState({
    Recommend? recommend,
    @Default(true) bool isLoading,
  }) = _ProductRecommendState;
}

final productRecommendProvider =
    StateNotifierProvider<ProductNotifier, ProductRecommendState>(
        (ref) => ProductNotifier());

final recommendApiData = FutureProvider<Recommend>((ref) {
  return BslmeiyuService().productRecommend();
});

class ProductNotifier extends StateNotifier<ProductRecommendState> {
  ProductNotifier() : super(ProductRecommendState()) {
    print('初始化 ProductRecommendNotifier');
  }

  loadProductPopular() async {
    state = state.copyWith(isLoading: true);
    final recommend = await BslmeiyuService().productRecommend();
    // Update state in provider
    state = state.copyWith(recommend: recommend, isLoading: false);
  }
}
