import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/app_scaffold.dart';
import 'package:let_api_flutter/src/riverpods/providers/route_provider.dart';
import 'package:let_api_flutter/src/ui/layout/main_layout.dart';
import 'package:let_api_flutter/src/ui/screens/account/account_screen.dart';
import 'package:let_api_flutter/src/ui/screens/history/history_screen.dart';
import 'package:let_api_flutter/src/ui/screens/home/cart_screen.dart';
import 'package:let_api_flutter/src/ui/screens/home/home.dart';
import 'package:let_api_flutter/src/ui/screens/home/popular_detail.dart';
import 'package:let_api_flutter/src/ui/screens/home/recommend_detail.dart';
import 'package:let_api_flutter/src/ui/screens/login/login_screen.dart';
import 'package:let_api_flutter/src/ui/screens/register/register_screen.dart';

class CartRouteExtraModel {
  String? routeMethod;
  CartRouteExtraModel({this.routeMethod});
}

class RouteNames {
  static const String me = 'me';
}

class ScreenPaths {
  static String home() => '/';
  static String popularDetail(int index, int pageId) =>
      '/popularDetail/$index?pageId=$pageId';
  static String recommendDetail(int index, int pageId) =>
      '/recommendDetail/$index?pageId=$pageId';
  static String cartInfo() => '/cartInfo';
  static String register() => '/register';
  static String login() => '/login';
  static String history() => '/history';
}

// 提供 debug 用的 label
final _productDetailNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'productDetail');
final _foodHomeNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'food');
final _musicHomeNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'music');
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
              }, transition: 'fadeIn'),

              // 推薦的美食
              AppRoute('/recommendDetail/:index', (state) {
                int pageId = int.parse(state.queryParameters['pageId']!);
                int index = int.parse(state.pathParameters['index']!);
                return RecommendDetailWidget(index: index, pageId: pageId);
              }),

              // 購物車
              AppRoute('/cartInfo', (GoRouterState state) {
                CartRouteExtraModel extra = state.extra as CartRouteExtraModel;

                return CartScreen(extra: extra);
              }, transition: 'slideUp'),

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
                    //bottomNavigationBar 的路由 index=1 註冊
                    StatefulShellBranch(
                      // navigatorKey: _musicHomeNavigatorAKey,
                      routes: [
                        AppRoute(
                          '/register',
                          (state) => RegisterScreen(),
                        ),
                      ],
                    ),
                    //bottomNavigationBar 的路由 index=2 History
                    StatefulShellBranch(
                      // navigatorKey: _musicHomeNavigatorAKey,
                      routes: [
                        AppRoute(
                          '/history',
                          (state) => HistoryScreen(),
                        ),
                      ],
                    ),

                    //bottomNavigationBar 的路由 index=3 Me
                    StatefulShellBranch(
                      // navigatorKey: _musicHomeNavigatorAKey,
                      routes: [
                        AppRoute('/me', (state) => AccountScreen()),
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
      {List<GoRoute> routes = const [], transition = 'fadeIn'})
      : super(
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
