import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/services/api/dio_client.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';

class PopularHttpService {
  Future<Product> getPopularProductList() async {
    final response = await DioClient().dio.get(
          AppConstants.POPULAR_PRODUCT_URI,
          options: Options(method: 'GET'),
        );
    return Product.fromJson(response.data);
  }
}

final apiProvider =
    Provider<PopularHttpService>((ref) => PopularHttpService()); // Provider

/// FutureProvider 處理 API
final popularHttpProvider = FutureProvider<Product>((ref) {
  return ref.read(apiProvider).getPopularProductList();
});
