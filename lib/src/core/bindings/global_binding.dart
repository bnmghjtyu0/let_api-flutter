import 'package:get/get.dart';
import 'package:let_api_flutter/src/core/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/core/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/core/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/core/services/api/api_client.dart';
import 'package:let_api_flutter/src/core/services/repository/cart_repo.dart';
import 'package:let_api_flutter/src/core/services/repository/popular_product_repo.dart';
import 'package:let_api_flutter/src/core/services/repository/recommend_product_repo.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    // api client
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

    // repos
    Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
    Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));
    Get.lazyPut(() => CartRepo(), fenix: true);

    // controllers
    Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
    Get.lazyPut(
        () => RecommendProductController(recommendProductRepo: Get.find()));
    Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
  }
}
