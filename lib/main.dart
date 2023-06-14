import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/core/bindings/global_binding.dart';
import 'package:let_api_flutter/src/core/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/core/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/core/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/routes/route_helper.dart';

class App extends StatelessWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context) {
    print('app build');
    Get.find<CartController>().getCartData();

    ///先在 splash 儲存資料後，接著在這裡 keep in the memory
    return GetBuilder<PopularProductController>(
      builder: (popular) {
        return GetBuilder<RecommendProductController>(
          builder: (recommend) {
            return GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                useMaterial3: true,
              ),
              // home: SplashScreen(),
              initialRoute: RouteNames.splash,
              getPages: RouteHelper.routes,
            );
          },
        );
      },
    );
  }
}

//入口
void main() {
  GlobalBinding().dependencies();
  runApp(App());
}
