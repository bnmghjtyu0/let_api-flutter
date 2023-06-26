import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/layout/main_layout.dart';
import 'package:let_api_flutter/src/routes/notifier_route.dart';
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
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'share');

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      refreshListenable: notifier,
      routes: <RouteBase>[
        GoRoute(
          name: RouteNames.splash,
          path: '/splash',
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: SplashScreen()),
        ),

        //bottomNavigationBar 的路由
        StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) {
              return MainLayout(navigationShell: navigationShell);
            },
            branches: [
              //bottomNavigationBar 的路由 index=0 美食平台
              StatefulShellBranch(
                navigatorKey: _foodHomeNavigatorAKey,
                routes: [
                  GoRoute(
                      name: RouteNames.foodHome,
                      path: '/',
                      pageBuilder: (context, state) => MaterialPage(
                          key: state.pageKey, child: MainFoodPage()),
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
})

    ///根路由
    ;
