import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/core/interceptors/kkbox_interceptor.dart';
import 'package:let_api_flutter/src/core/widgets/bottom_navigation_bar.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/common_drawer.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainLayout({Key? key, required this.navigationShell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KkboxInterceptor.context = context;
    return Scaffold(
      body: Center(
        child: navigationShell,
      ),
      drawer: CommonDrawer(),
      bottomNavigationBar:
          BottomNavigationBarCustom(navigationShell: navigationShell),
    );
  }
}
