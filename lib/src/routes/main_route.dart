import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/core/widgets/bottom_navigation_bar.dart';
import 'package:let_api_flutter/src/screens/food_delivery/main_food_page.dart';

class RouteNames {
  static const String foodHome = 'foodHome';
  static const String musicHome = 'musicHome';
}

// 提供 debug 用的 label
final _testANavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Food');
final _testBNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Music');

final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavigationBarCustom(navigationShell: navigationShell);
          },
          branches: [
            // A
            StatefulShellBranch(
              navigatorKey: _testANavigatorAKey,
              routes: [
                GoRoute(
                  name: RouteNames.foodHome,
                  path: '/',
                  pageBuilder: (context, state) =>
                      MaterialPage(key: state.pageKey, child: MainFoodPage()),
                ),
              ],
            ),
          ]),
    ]);
