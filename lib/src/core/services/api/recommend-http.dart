import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:let_api_flutter/src/core/models/recommend_model.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';

class RecommendHttp {
  String endpoint =
      '${AppConstants.BASE_URL}${AppConstants.RECOMMENDED_PRODUCT_URI}';
  Future<Recommend> getRecommendProduct() async {
    Response response = await get(Uri.parse(endpoint));
    return Recommend.fromJson(jsonDecode(response.body));
  }
}

final apiProvider =
    Provider<RecommendHttp>((ref) => RecommendHttp()); // Provider
final recommendHttpProvider = FutureProvider<Recommend>((ref) {
  return ref.read(apiProvider).getRecommendProduct();
});
