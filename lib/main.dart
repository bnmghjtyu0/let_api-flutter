import 'package:firebase_core/firebase_core.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:let_api_flutter/src/app_scaffold.dart';
import 'package:let_api_flutter/src/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/services/firebase_service.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/styles/material_basil_theme.dart';

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
              theme: const BasilTheme().toThemeData(),
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
  await Firebase.initializeApp();
  await CommonFirebaseService().initCrash();
  await CommonFirebaseService().initNotifications();
  //載入 api
  await ref.read(productPopularProvider.notifier).loadProductPopular();
  await ref.read(productRecommendProvider.notifier).loadProductPopular();
  //取得購物車資料 localStorage
  ref.read(cartProvider.notifier).getCartData();
}

/// Create singletons (logic and services) that can be shared across the app.
void registerSingletons() {
  // GetIt.I.registerSingleton<Dimensions>(() => Dimensions());
}

// global
AppStyle get $styles => AppScaffold.style;
