import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';

class PopularHttp {
  String endpoint =
      '${AppConstants.BASE_URL}${AppConstants.POPULAR_PRODUCT_URI}';

  Future<Product> getPopularProductList() async {
    Response response = await get(Uri.parse(endpoint));
    return Product.fromJson(jsonDecode(response.body));
  }
}

final apiProvider = Provider<PopularHttp>((ref) => PopularHttp()); // Provider
final popularHttpProvider = FutureProvider<Product>((ref) {
  return ref.read(apiProvider).getPopularProductList();
});
