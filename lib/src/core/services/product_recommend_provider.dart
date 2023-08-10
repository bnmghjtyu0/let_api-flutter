// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/core/models/recommend_model.dart';
import 'package:let_api_flutter/src/core/services/api/bslmeiyu_api.dart';

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
    debugPrint('初始化 ProductRecommendNotifier');
  }

  void loadProductPopular() async {
    state = state.copyWith(isLoading: true);
    final recommend = await BslmeiyuService().productRecommend();
    // Update state in provider
    state = state.copyWith(recommend: recommend, isLoading: false);
  }
}
