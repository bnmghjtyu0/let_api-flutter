import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:let_api_flutter/register_singletons.dart';
import 'package:let_api_flutter/src/app.dart';
import 'package:let_api_flutter/src/core/services/firebase_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/core/services/product_recommend_provider.dart';

/// Initialize the app and all main actors.
Future<void> bootstrap(ProviderContainer ref) async {
  debugPrint('bootstrap start...');

  //載入 firebase 服務
  await CommonFirebaseService().init();

  // 讀取 api
  await ref.read(productPopularProvider.notifier).loadProductPopular();
  await ref.read(productRecommendProvider.notifier).loadProductPopular();
}

//專案起點
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep native splash screen up until app is finished bootstrapping
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
