import 'package:let_api_flutter/src/screens/cart/cart_page.dart';
import 'package:let_api_flutter/src/screens/food_delivery/food_delivery.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/screens/food_delivery/popular_detail.dart';
import 'package:let_api_flutter/src/screens/food_delivery/recommend_detail.dart';

/// 路由名稱
abstract class RouteNames {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendFood = '/recommend-food';
  static const String cartPage = '/cart';
}

/// 路由
/// 使用方式：Get.toNamed(RouteHelper.getPopularFood());
class RouteHelper {
  //首頁
  static String getInitial() => RouteNames.initial;
  static String getPopularFood(int pageId) =>
      '${RouteNames.popularFood}?pageId=$pageId';
  static String getRecommendFood(int pageId) =>
      '${RouteNames.recommendFood}?pageId=$pageId';
  static String getCartPage() => RouteNames.cartPage;

  static List<GetPage> routes = [
    GetPage(name: RouteNames.initial, page: () => MainFoodPage()),
    GetPage(
        name: RouteNames.popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularDetail(pageId: int.parse(pageId!));
        },
        middlewares: [
          // PremiumGuard(), // Add the middleware here
        ],
        //換頁特效
        transition: Transition.fadeIn),
    GetPage(
        name: RouteNames.recommendFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendDetailWidget(pageId: int.parse(pageId!));
        }),
    GetPage(name: RouteNames.cartPage, page: () => CartPage())
  ];
}
