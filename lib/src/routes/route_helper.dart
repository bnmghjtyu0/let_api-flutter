import 'package:let_api_flutter/src/pages/food_delivery/food_delivery.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/pages/food_delivery/popular_detail.dart';
import 'package:let_api_flutter/src/pages/food_delivery/recommend_detail.dart';

/// 路由
/// 使用方式：Get.toNamed(RouteHelper.getPopularFood());
class RouteHelper {
  //首頁
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendFood = '/recommend-food';

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendFood(int pageId) => '$recommendFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: recommendFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendDetailWidget(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularDetail(pageId: int.parse(pageId!));
        },
        //換頁特效
        transition: Transition.fadeIn),
  ];
}
