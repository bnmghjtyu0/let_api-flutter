import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/helper/dependencies.dart';
import 'package:let_api_flutter/src/screens/food_delivery/food_delivery.dart';
import 'package:let_api_flutter/src/routes/route_helper.dart';

class App extends StatelessWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context) {
    init();
    print('app build');
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendProductController>().getRecommendProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainFoodPage(),
      initialRoute: Routes.initial,
      getPages: RouteHelper.routes,
    );
  }
}

//入口
void main() {
  runApp(App());
}
