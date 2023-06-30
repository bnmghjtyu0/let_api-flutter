import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/router.dart';
import 'package:let_api_flutter/src/styles/material_basil_theme.dart';

class App extends StatelessWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final goRouter = ref.read(goRouterProvider);
      const basilTheme = BasilTheme();
      return MaterialApp.router(
          title: 'Flutter Demo',
          theme: basilTheme.toThemeData(),
          routerConfig: goRouter);
    });
  }
}
