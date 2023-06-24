import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/core/bindings/global_binding.dart';
import 'package:let_api_flutter/src/core/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/core/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/core/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('app build');
    Get.find<CartController>().getCartData();

    ///先在 splash 儲存資料後，接著在這裡 keep in the memory
    return GetBuilder<PopularProductController>(
      builder: (popular) {
        return GetBuilder<RecommendProductController>(
          builder: (recommend) {
            return MaterialApp.router(
                title: 'Flutter Demo',
                theme: ThemeData(
                  useMaterial3: true,
                ),
                routerConfig: router);
          },
        );
      },
    );
  }
}

//入口
void main() {
  GlobalBinding().dependencies();
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
