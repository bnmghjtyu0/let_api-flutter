import 'package:let_api_flutter/src/screens/cart/cart_page.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/screens/food_delivery/popular_detail.dart';
import 'package:let_api_flutter/src/screens/food_delivery/recommend_detail.dart';
import 'package:let_api_flutter/src/screens/splash/splash_screen.dart';

/// 路由名稱
abstract class RouteNamess {
  static const String splash = '/splash';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendFood = '/recommend-food';
  static const String cartPage = '/cart';
}

/// 路由
/// 使用方式：Get.toNamed(RouteHelper.getPopularFood());
class RouteHelper {
  static String getSplash() => RouteNamess.splash;
  //首頁
  static String getInitial() => RouteNamess.initial;
  static String getPopularFood(int pageId, String page) =>
      '${RouteNamess.popularFood}?pageId=$pageId&page=$page';
  static String getRecommendFood(int pageId, String page) =>
      '${RouteNamess.recommendFood}?pageId=$pageId&page=$page';
  static String getCartPage() => RouteNamess.cartPage;

  static List<GetPage> routes = [
    GetPage(name: RouteNamess.splash, page: () => SplashScreen()),
    // GetPage(name: RouteNamess.initial, page: () => BottomNavigationBarCustom()),
    GetPage(
        name: RouteNamess.popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];

          return PopularDetail(pageId: int.parse(pageId!), page: page!);
        },
        middlewares: [
          // PremiumGuard(), // Add the middleware here
        ],
        //換頁特效
        transition: Transition.fadeIn),
    GetPage(
      name: RouteNamess.recommendFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendDetailWidget(pageId: int.parse(pageId!), page: page!);
      },
    ),
    GetPage(name: RouteNamess.cartPage, page: () => CartPage())
  ];
}
