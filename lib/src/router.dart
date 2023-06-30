import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/app_scaffold.dart';
import 'package:let_api_flutter/src/riverpods/providers/route_provider.dart';
import 'package:let_api_flutter/src/ui/layout/main_layout.dart';
import 'package:let_api_flutter/src/ui/screens/cart/cart_screen.dart';
import 'package:let_api_flutter/src/ui/screens/home/home.dart';
import 'package:let_api_flutter/src/ui/screens/home/popular_detail.dart';
import 'package:let_api_flutter/src/ui/screens/home/recommend_detail.dart';

class RouteNames {
  static const String me = 'me';
}

class ScreenPaths {
  static String home() => '/';
  static String foodDetail(int pageId) => '/foodDetail/$pageId';
  static String recommendDetail(int pageId) => '/foodDetail/$pageId';
  static String cart() => '/cart';
  static String cartInfo() => '/cartInfo';
  static String history() => '/history';
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
        ShellRoute(
            builder: (context, router, navigator) {
              return AppScaffold(child: navigator);
            },
            routes: [
              // 受歡迎的美食
              AppRoute('/foodDetail/:pageId', (state) {
                int pageId = int.parse(state.pathParameters['pageId']!);
                return PopularDetail(pageId: pageId);
              }, useFade: true),

              // 推薦的美食
              AppRoute('/recommendDetail/:pageId', (state) {
                int pageId = int.parse(state.pathParameters['pageId']!);
                return RecommendDetailWidget(pageId: pageId);
              }),

              // 購物車
              AppRoute('/cartInfo', (state) => CartScreen()),

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
                        AppRoute('/', (state) => HomeScreen()),
                      ],
                    ),
                    //bottomNavigationBar 的路由 index=1 History
                    StatefulShellBranch(
                      // navigatorKey: _musicHomeNavigatorAKey,
                      routes: [
                        AppRoute(
                            '/history',
                            (state) => Center(
                                  child: Text('歷史紀錄'),
                                )),
                      ],
                    ),
                    //bottomNavigationBar 的路由 index=2 Cart
                    StatefulShellBranch(
                      // navigatorKey: _musicHomeNavigatorAKey,
                      routes: [
                        AppRoute(
                          '/cart',
                          (state) => Center(
                            child: Text('購物車'),
                          ),
                        ),
                      ],
                    ),
                    //bottomNavigationBar 的路由 index=3 Me
                    StatefulShellBranch(
                      // navigatorKey: _musicHomeNavigatorAKey,
                      routes: [
                        AppRoute(
                          '/me',
                          (state) => Center(
                            child: Text('關於作者'),
                          ),
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
            ])
      ]);
});

//路由共用公式
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState state) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );

            //使用換頁效果 fade
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return MaterialPage(child: pageContent);
          },
        );
  final bool useFade;
}
