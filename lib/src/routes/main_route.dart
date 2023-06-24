import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/core/widgets/bottom_navigation_bar.dart';
import 'package:let_api_flutter/src/screens/food_delivery/main_food_page.dart';
import 'package:let_api_flutter/src/screens/splash/splash_screen.dart';

class RouteNames {
  static const String splash = 'splash';
  static const String foodHome = 'foodHome';
  static const String musicHome = 'musicHome';
}

// 提供 debug 用的 label
final _testANavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Food');
final _testBNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Music');

final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splash',
    routes: <RouteBase>[
      GoRoute(
        name: RouteNames.splash,
        path: '/splash',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: SplashScreen()),
      ),
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
