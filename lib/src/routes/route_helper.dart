import 'package:let_api_flutter/src/screens/cart/cart_page.dart';
import 'package:let_api_flutter/src/screens/food_delivery/food_delivery.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/screens/food_delivery/popular_detail.dart';
import 'package:let_api_flutter/src/screens/food_delivery/recommend_detail.dart';

abstract class Routes {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendFood = '/recommend-food';
  static const String cartPage = '/cart';
}

/// 路由
/// 使用方式：Get.toNamed(RouteHelper.getPopularFood());
class RouteHelper {
  //首頁
  static String getInitial() => Routes.initial;
  static String getPopularFood(int pageId) =>
      '${Routes.popularFood}?pageId=$pageId';
  static String getRecommendFood(int pageId) =>
      '${Routes.recommendFood}?pageId=$pageId';
  static String getCartPage() => Routes.cartPage;

  static List<GetPage> routes = [
    GetPage(name: Routes.initial, page: () => MainFoodPage()),
    GetPage(
        name: Routes.recommendFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendDetailWidget(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: Routes.popularFood,
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
        name: Routes.cartPage,
        page: () {
          return CartPage();
        })
  ];
}
