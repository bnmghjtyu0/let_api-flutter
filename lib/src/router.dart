import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/route_provider.dart';
import 'package:let_api_flutter/src/layout/main_layout.dart';
import 'package:let_api_flutter/src/screens/cart/cart_screen.dart';
import 'package:let_api_flutter/src/screens/home/home.dart';
import 'package:let_api_flutter/src/screens/home/popular_detail.dart';
import 'package:let_api_flutter/src/screens/home/recommend_detail.dart';

class RouteNames {
  static const String splash = 'splash';
  static const String foodHome = 'foodHome';
  static const String foodDetail = 'foodDetail';
  static const String recommendDetail = 'recommendDetail';
  static const String musicHome = 'musicHome';
  static const String history = 'history';
  static const String cart = 'cart';
  static const String cartInfo = 'cartInfo';
  static const String me = 'me';
}

// 提供 debug 用的 label
final _foodHomeNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Food');
final _musicHomeNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Music');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'share');

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      refreshListenable: notifier,
      routes: <RouteBase>[
        // 受歡迎的美食
        GoRoute(
          name: RouteNames.foodDetail,
          path: '/foodDetail/:pageId',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: PopularDetail(
                  pageId: int.parse(state.pathParameters['pageId']!))),
        ),

        // 推薦的美食
        GoRoute(
          name: RouteNames.recommendDetail,
          path: '/recommendDetail/:pageId',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: RecommendDetailWidget(
                pageId: int.parse(state.pathParameters['pageId']!),
              )),
        ),

        // 購物車
        GoRoute(
          name: RouteNames.cartInfo,
          path: '/cartInfo',
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: CartScreen()),
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
                    pageBuilder: (context, state) =>
                        MaterialPage(key: state.pageKey, child: HomeScreen()),
                  ),
                ],
              ),
              //bottomNavigationBar 的路由 index=1 History
              StatefulShellBranch(
                // navigatorKey: _musicHomeNavigatorAKey,
                routes: [
                  GoRoute(
                    name: RouteNames.history,
                    path: '/history',
                    pageBuilder: (context, state) => MaterialPage(
                        key: state.pageKey,
                        child: Center(
                          child: Text('歷史紀錄'),
                        )),
                  ),
                ],
              ),
              //bottomNavigationBar 的路由 index=2 Cart
              StatefulShellBranch(
                // navigatorKey: _musicHomeNavigatorAKey,
                routes: [
                  GoRoute(
                    name: RouteNames.cart,
                    path: '/cart',
                    pageBuilder: (context, state) => MaterialPage(
                        key: state.pageKey,
                        child: Center(
                          child: Text('購物車'),
                        )),
                  ),
                ],
              ),
              //bottomNavigationBar 的路由 index=3 Me
              StatefulShellBranch(
                // navigatorKey: _musicHomeNavigatorAKey,
                routes: [
                  GoRoute(
                    name: RouteNames.me,
                    path: '/me',
                    pageBuilder: (context, state) => MaterialPage(
                        key: state.pageKey,
                        child: Center(
                          child: Text('關於作者'),
                        )),
                  ),
                ],
              ),

              // StatefulShellBranch(
              //   navigatorKey: _musicHomeNavigatorAKey,
              //   routes: [
              //     GoRoute(
              //       name: RouteNames.musicHome,
              //       path: '/musicHome',
              //       pageBuilder: (context, state) => MaterialPage(
              //           key: state.pageKey,
              //           child: MusicHomeScreen(
              //             title: '音樂時光',
              //           )),
              //     ),
              //   ],
              // ),
            ]),
      ]);
});
