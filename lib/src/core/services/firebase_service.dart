import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:let_api_flutter/firebase_options.dart';

/// firebase 服務
class CommonFirebaseService {
  ///初始化
  Future<void> init() async {
    print('firebase init');

    /// ----start ---- 加入 firebase 設定 --------
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// ----start ---- FirebaseCrashlytics 當有錯誤時，告訴 firebase   --------
    FlutterError.onError = (errorDetails) {
      // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    /// ----end ---- FirebaseCrashlytics 當有錯誤時，告訴 firebase   --------
  }
}
