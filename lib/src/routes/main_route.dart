import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/core/widgets/bottom_navigation_bar.dart';
import 'package:let_api_flutter/src/screens/food_delivery/main_food_page.dart';
import 'package:let_api_flutter/src/screens/food_delivery/popular_detail.dart';
import 'package:let_api_flutter/src/screens/food_delivery/recommend_detail.dart';
import 'package:let_api_flutter/src/screens/music/music_home_screen.dart';
import 'package:let_api_flutter/src/screens/splash/splash_screen.dart';

class RouteNames {
  static const String splash = 'splash';
  static const String foodHome = 'foodHome';
  static const String foodDetail = 'foodDetail';
  static const String recommendDetail = 'recommendDetail';
  static const String musicHome = 'musicHome';
}

// 提供 debug 用的 label
final _foodHomeNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Food');
final _musicHomeNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Music');

///根路由
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

      //bottomNavigationBar 的路由
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavigationBarCustom(navigationShell: navigationShell);
          },
          branches: [
            //bottomNavigationBar 的路由 index=0 美食平台
            StatefulShellBranch(
              navigatorKey: _foodHomeNavigatorAKey,
              routes: [
                GoRoute(
                    name: RouteNames.foodHome,
                    path: '/',
                    pageBuilder: (context, state) =>
                        MaterialPage(key: state.pageKey, child: MainFoodPage()),
                    routes: [
                      // 受歡迎的美食
                      GoRoute(
                        name: RouteNames.foodDetail,
                        path: 'foodDetail/:pageId',
                        pageBuilder: (context, state) => MaterialPage(
                            key: state.pageKey,
                            child: PopularDetail(
                                pageId: int.parse(
                                    state.pathParameters['pageId']!))),
                      ),

                      // 推薦的美食
                      GoRoute(
                        name: RouteNames.recommendDetail,
                        path: 'recommendDetail/:pageId',
                        pageBuilder: (context, state) => MaterialPage(
                            key: state.pageKey,
                            child: RecommendDetailWidget(
                              pageId:
                                  int.parse(state.pathParameters['pageId']!),
                            )),
                      ),
                    ]),
              ],
            ),
            //bottomNavigationBar 的路由 index=1 音樂
            StatefulShellBranch(
              navigatorKey: _musicHomeNavigatorAKey,
              routes: [
                GoRoute(
                  name: RouteNames.musicHome,
                  path: '/musicHome',
                  pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: MusicHomeScreen(
                        title: '音樂時光',
                      )),
                ),
              ],
            ),
          ]),
    ]);
