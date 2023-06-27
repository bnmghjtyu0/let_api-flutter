import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/interceptors/kkbox_interceptor.dart';
import 'package:let_api_flutter/src/core/services/firebase_service.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('app build');
    KkboxInterceptor.context = context;

    final goRouter = ref.read(goRouterProvider);

    ///先在 splash 儲存資料後，接著在這裡 keep in the memory
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: goRouter);
  }
}

//入口
Future<void> main() async {
  // GlobalBinding().dependencies();

  ///載入 firebase 服務
  await CommonFirebaseService().init();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
