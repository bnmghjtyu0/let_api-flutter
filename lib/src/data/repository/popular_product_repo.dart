import 'package:get/get.dart';
import 'package:let_api_flutter/src/data/api/api_client.dart';
import 'package:let_api_flutter/src/utils/constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  ///建構子
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
