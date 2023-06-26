import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/models/recommend_model.dart';
import 'package:let_api_flutter/src/core/services/api/dio_client.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';

///推薦 api 服務
class RecommendHttpService {
  Future<Recommend> getRecommendProduct() async {
    final response = await DioClient().dio.get(
          AppConstants.RECOMMENDED_PRODUCT_URI,
          options: Options(method: 'GET'),
        );
    return Recommend.fromJson(response.data);
  }
}

final apiProvider =
    Provider<RecommendHttpService>((ref) => RecommendHttpService()); // Provider
final recommendHttpProvider = FutureProvider<Recommend>((ref) {
  return ref.read(apiProvider).getRecommendProduct();
});
