import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/constants/dimensions.dart';
import 'package:let_api_flutter/src/router.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';

///進入 app 的動畫
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).goNamed(ScreenPaths.home());
    });
  }

//初始化時，載入 controllers
  void _loadResource() async {
    // 讀取 api
    ref.read(productPopularProvider.notifier);
    ref.read(productRecommendProvider.notifier);
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
