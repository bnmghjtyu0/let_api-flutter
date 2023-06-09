import 'package:get/get.dart';
import 'package:let_api_flutter/src/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/data/api/api_client.dart';
import 'package:let_api_flutter/src/data/repository/cart_repo.dart';
import 'package:let_api_flutter/src/data/repository/popular_product_repo.dart';
import 'package:let_api_flutter/src/data/repository/recommend_product_repo.dart';
import 'package:let_api_flutter/src/utils/constants.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

// repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendProductController(recommendProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
