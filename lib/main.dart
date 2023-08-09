import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/app_scaffold.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/core/services/firebase_service.dart';
import 'package:let_api_flutter/src/core/services/navigation_service.dart';
import 'package:let_api_flutter/src/core/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/core/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/core/services/refresh_indicator_service.dart';
import 'package:let_api_flutter/src/core/services/scroll_service.dart';
import 'package:let_api_flutter/src/styles/themes/basil.dart';
import 'package:let_api_flutter/src/styles/themes/dark.dart';
import 'package:let_api_flutter/src/widgets/dialogs/dispatch.dart';

//專案起點
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 載入 splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //container: 可以在 main 裡面使用 RiverPod 的方法
  final container = ProviderContainer();
  registerSingletons();
  await bootstrap(container);

  runApp(
    //使用 RiverPod
    UncontrolledProviderScope(
        container: container,
        child: Consumer(builder: (context, ref, child) {
          final goRouter = ref.read(goRouterProvider);
          return MaterialApp.router(
              title: 'Flutter Demo',
              theme: const MaterialBasilTheme().toTheme(),
              // theme: ThemeData.light(),
              darkTheme: materialDarkTheme(darkScheme.primary),
              themeMode: ThemeMode.light,
              routerConfig: goRouter);
        })),
  );

  // 卸載 splash screen
  FlutterNativeSplash.remove();
}

/// 啟動專案時載入的服務
Future<void> bootstrap(ProviderContainer ref) async {
  debugPrint('bootstrap start...');
  //載入 firebase 服務
  if (!kIsWeb) {
    await Firebase.initializeApp();
    await CommonFirebaseService().initCrash();
    await CommonFirebaseService().initNotifications();
  }
  //載入 api
  await ref.read(productPopularProvider.notifier).loadProductPopular();
  await ref.read(productRecommendProvider.notifier).loadProductPopular();
  //取得購物車資料 localStorage
  ref.read(cartProvider.notifier).getCartData();
}

/// Create singletons (logic and services) that can be shared across the app.
void registerSingletons() {
  ///執行實例 NavigationService Class
  GetIt.I.registerSingleton<NavigationService>(NavigationService());
  GetIt.I.registerSingleton<RefreshIndicatorService>(RefreshIndicatorService());
  GetIt.I.registerSingleton<ScrollService>(ScrollService());
}

// global
///調用 styles
AppStyle get $styles => AppScaffold.style;

///調用 dialog
DialogHandler get $dialogDispatch => DialogHandler();

///取得 global context
BuildContext get $context => GetIt.I<NavigationService>().getContext();

///取得下拉刷新元件服務
RefreshIndicatorService get $refreshIndicatorService =>
    GetIt.I<RefreshIndicatorService>();

///取得 Scroll 服務
ScrollService get $scrollService => GetIt.I<ScrollService>();
