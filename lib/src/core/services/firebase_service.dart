// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/core/services/platform.dart';
import 'package:let_api_flutter/src/widgets/dialogs/notification_dialog.dart';

/// firebase 服務
class CommonFirebaseService {
  static dynamic context;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// app crash reporter
  Future<void> initCrash() async {
    debugPrint('firebase init');

    /// ----start ---- FirebaseCrashlytics 當有錯誤時，告訴 firebase   --------
    FlutterError.onError = (errorDetails) {
      ///網頁版不能使用 FirebaseCrashlytics
      if (!kIsWeb) {
        // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      }
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      ///網頁版不能使用 FirebaseCrashlytics
      if (!kIsWeb) {
        // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
      return true;
    };

    /// ----end ---- FirebaseCrashlytics 當有錯誤時，告訴 firebase   --------
  }

  ///初始化推播
  Future<void> initNotifications() async {
    await Firebase.initializeApp();
    await messaging.requestPermission();

    ///ios 需要申請 APNs 憑證才能使用
    if (PlatformInfo.isIOS) return;

    // final fcmToken = await messaging.getToken();
    // 前景推播
    FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);
    // 背景推播
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

///背景推播 - 手機上方跳出訊息
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}

///前景推播 - 使用 dialog 出現訊息
@pragma('vm:entry-point')
Future<void> _firebaseMessagingForegroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    $dialogDispatch.showNotificationDialog(NotificationDialogData(
        title: message.notification?.title,
        content: message.notification?.body,
        data: message.data));
  }
}
