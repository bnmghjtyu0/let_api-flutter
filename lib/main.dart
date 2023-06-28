import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/app.dart';
import 'package:let_api_flutter/src/core/services/firebase_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//專案起點
void main() async {
  ///載入 firebase 服務，網頁版不能使用 firebase
  if (!kIsWeb) {
    await CommonFirebaseService().init();
  }

  runApp(
    //使用 RiverPod
    ProviderScope(
      child: App(),
    ),
  );
}
