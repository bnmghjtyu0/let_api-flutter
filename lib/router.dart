import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/app_scaffold.dart';
import 'package:let_api_flutter/src/core/models/router_model.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/route_provider.dart';
import 'package:let_api_flutter/src/core/services/navigation_service.dart';
import 'package:let_api_flutter/src/ui/common/layout/main_layout.dart';
import 'package:let_api_flutter/src/ui/screens/account/account_screen.dart';
import 'package:let_api_flutter/src/ui/screens/cart/cart_screen.dart';
import 'package:let_api_flutter/src/ui/screens/history/history_screen.dart';
import 'package:let_api_flutter/src/ui/screens/login/login_screen.dart';
import 'package:let_api_flutter/src/ui/screens/popular_detail/popular_detail.dart';
import 'package:let_api_flutter/src/ui/screens/recommend_detail/recommend_detail.dart';
import 'package:let_api_flutter/src/ui/screens/register/register_screen.dart';
import 'package:let_api_flutter/src/ui/screens/search/search_screen.dart';
import 'package:let_api_flutter/src/ui/screens/widget_demo/widget_demo_screen.dart';

///各個畫面的路徑連結
class ScreenPaths {
  //首頁
  static String home() => '/home';
  //受歡迎商品
  static String popularDetail(int index, int pageId) =>
      '/popularDetail/$index?pageId=$pageId';
  //推薦商品
  static String recommendDetail(int index, int pageId) =>
      '/recommendDetail/$index?pageId=$pageId';
  //購物車
  static String cart() => '/cart';
  //註冊
  static String register() => '/register';
  //登入
  static String login() => '/login';
  //購買紀錄
  static String history() => '/history';
  //搜尋
  static String search() => '/search';
  //搜尋
  static String account() => '/account';
}

final _rootNavigatorKey = GetIt.I<NavigationService>().navigatorKey;
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'food');

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/home',
      refreshListenable: notifier,
      routes: <RouteBase>[
        ShellRoute(
            navigatorKey: _rootNavigatorKey,
            builder: (context, router, navigator) {
              return AppScaffold(child: navigator);
            },
            routes: [
              // 註冊
              AppRoute('/register', (state) {
                return RegisterScreen();
              }, transition: 'fadeIn'),
              // 登入
              AppRoute('/login', (state) {
                return LoginScreen();
              }, transition: 'fadeIn'),
              // 受歡迎的美食
              AppRoute('/popularDetail/:index', (state) {
                int index = int.parse(state.pathParameters['index']!);
                int pageId = int.parse(state.queryParameters['pageId']!);
                return PopularDetail(index: index, pageId: pageId);
              }, transition: 'fadeIn', parentNavigatorKey: _rootNavigatorKey),

              // 推薦的美食
              AppRoute('/recommendDetail/:index', (state) {
                int pageId = int.parse(state.queryParameters['pageId']!);
                int index = int.parse(state.pathParameters['index']!);
                return RecommendDetailWidget(index: index, pageId: pageId);
              }, parentNavigatorKey: _rootNavigatorKey),

              // 購物車
              AppRoute('/cart', (GoRouterState state) {
                CartRouteExtraModel extra = state.extra as CartRouteExtraModel;

                return CartScreen(extra: extra);
              }, transition: 'slideUp', parentNavigatorKey: _rootNavigatorKey),

              //bottomNavigationBar 的路由
              StatefulShellRoute.indexedStack(
                  builder: (BuildContext context, GoRouterState state,
                      StatefulNavigationShell navigationShell) {
                    return MainLayout(navigationShell: navigationShell);
                  },
                  branches: [
                    // bottomNavigationBar 的路由 index=0 美食平台
                    StatefulShellBranch(
                      navigatorKey: _homeNavigatorKey,
                      routes: [
                        AppRoute('/home', (state) => WidgetDemoScreen()),
                      ],
                    ),
                    //bottomNavigationBar 的路由 index=1 搜尋頁面
                    StatefulShellBranch(
                      routes: [
                        AppRoute('/search', (state) => SearchScreen()),
                      ],
                    ),
                    //bottomNavigationBar 的路由 index=2 註冊
                    StatefulShellBranch(
                      routes: [
                        AppRoute(
                          '/register',
                          (state) => RegisterScreen(),
                        ),
                      ],
                    ),
                    //bottomNavigationBar 的路由 index=3 History
                    StatefulShellBranch(
                      routes: [
                        AppRoute(
                          '/history',
                          (state) => HistoryScreen(),
                        ),
                      ],
                    ),

                    //bottomNavigationBar 的路由 index=4 Me
                    StatefulShellBranch(
                      routes: [
                        AppRoute('/account', (state) => AccountScreen()),
                      ],
                    ),

                    // StatefulShellBranch(
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
      {List<GoRoute> routes = const [],
      transition = 'fadeIn',
      parentNavigatorKey})
      : super(
          parentNavigatorKey: parentNavigatorKey,
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );

            //使用換頁效果 fade
            if (transition == 'fadeIn') {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            if (transition == 'slideUp') {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        SlideTransition(
                            position: animation.drive(
                              Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.linear)),
                            ),
                            child: child),
              );
            }
            return MaterialPage(child: pageContent);
          },
        );
}
