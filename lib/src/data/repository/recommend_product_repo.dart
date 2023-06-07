import 'package:get/get.dart';
import 'package:let_api_flutter/src/data/api/api_client.dart';
import 'package:let_api_flutter/src/utils/constants.dart';

class RecommendProductRepo extends GetxService {
  final ApiClient apiClient;

  ///建構子
  RecommendProductRepo({required this.apiClient});

  Future<Response> getRecommendProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
