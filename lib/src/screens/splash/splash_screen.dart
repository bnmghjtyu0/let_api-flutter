import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

//初始化時，載入 controllers
  Future<void> _loadResource() async {
    await PopularProductController().getPopularProductList(ref);
    // await Get.find<RecommendProductController>().getRecommendProductList();
  }

  @override
  void initState() {
    super.initState();
    // _loadResource();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3), () {
      print('進入首頁');
      GoRouter.of(context).goNamed(RouteNames.foodHome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
                scale: animation,
                child: Center(
                  child: Image.asset(
                    "assets/image/lake.jpg",
                    width: Dimensions(context).splashImg(),
                  ),
                ))
          ],
        ));
  }
}
