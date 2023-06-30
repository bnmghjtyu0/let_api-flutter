import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:let_api_flutter/src/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/services/firebase_service.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';

/// Initialize the app and all main actors.
Future<void> bootstrap(ProviderContainer ref) async {
  debugPrint('bootstrap start...');
  //載入 firebase 服務
  await CommonFirebaseService().init();
  //載入 api
  await ref.read(productPopularProvider.notifier).loadProductPopular();
  await ref.read(productRecommendProvider.notifier).loadProductPopular();
}

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
      child: App(),
    ),
  );

  // Remove splash screen when bootstrap is complete
  FlutterNativeSplash.remove();
}

/// Create singletons (logic and services) that can be shared across the app.
void registerSingletons() {
  // GetIt.I.registerSingleton<Dimensions>(() => Dimensions());
}

// Dimensions get dimensions => GetIt.I.get<Dimensions>();