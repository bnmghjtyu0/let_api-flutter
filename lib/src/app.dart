import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';

class App extends StatelessWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context) {
    // KkboxInterceptor.context = context;

    return Consumer(builder: (context, ref, child) {
      final goRouter = ref.read(goRouterProvider);

      return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerConfig: goRouter);
    });
  }
}
