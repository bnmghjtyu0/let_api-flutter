import 'package:let_api_flutter/src/core/widgets/bottomNavigation_bar.dart';
import 'package:let_api_flutter/src/screens/cart/cart_page.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/screens/food_delivery/popular_detail.dart';
import 'package:let_api_flutter/src/screens/food_delivery/recommend_detail.dart';
import 'package:let_api_flutter/src/screens/splash/splash_screen.dart';

/// 路由名稱
abstract class RouteNames {
  static const String splash = '/splash';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendFood = '/recommend-food';
  static const String cartPage = '/cart';
}

/// 路由
/// 使用方式：Get.toNamed(RouteHelper.getPopularFood());
class RouteHelper {
  static String getSplash() => RouteNames.splash;
  //首頁
  static String getInitial() => RouteNames.initial;
  static String getPopularFood(int pageId, String page) =>
      '${RouteNames.popularFood}?pageId=$pageId&page=$page';
  static String getRecommendFood(int pageId, String page) =>
      '${RouteNames.recommendFood}?pageId=$pageId&page=$page';
  static String getCartPage() => RouteNames.cartPage;

  static List<GetPage> routes = [
    GetPage(name: RouteNames.splash, page: () => SplashScreen()),
    GetPage(name: RouteNames.initial, page: () => BottomNavigationBarCustom()),
    GetPage(
        name: RouteNames.popularFood,
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
      name: RouteNames.recommendFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendDetailWidget(pageId: int.parse(pageId!), page: page!);
      },
    ),
    GetPage(name: RouteNames.cartPage, page: () => CartPage())
  ];
}
