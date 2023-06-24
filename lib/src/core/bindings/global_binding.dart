import 'package:get/get.dart';
import 'package:let_api_flutter/src/core/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/core/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/core/services/api/api_client.dart';
import 'package:let_api_flutter/src/core/services/repository/cart_repo.dart';
import 'package:let_api_flutter/src/core/services/repository/popular_product_repo.dart';
import 'package:let_api_flutter/src/core/services/repository/recommend_product_repo.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() async {
    // shared_preferences 取得 instance
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);

    // api client
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

    // repos
    Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
    Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));
    //sharedPreferences 傳值
    Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()), fenix: true);

    // controllers
    // Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
    Get.lazyPut(
        () => RecommendProductController(recommendProductRepo: Get.find()),
        fenix: true);
    Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
  }
}
