import 'package:dio/dio.dart';
import 'package:flutter/scheduler.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/common/widgets/dialogs/error_dialog.dart';
import 'package:let_api_flutter/src/ui/common/widgets/dialogs/notification_dialog.dart';

///調用 dialog 的方法
class DialogHandler extends Interceptor {
  /// 在 [MainLayout] 中注入 context
  static dynamic context;

  ///調用推播 dialog
  void showNotificationDialog(
    NotificationDialogData data,
  ) {
    //addPostFrameCallback: 可以在 initState 中使用 dialog
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) => NotificationDialog(data: data));
    });
  }

  ///調用錯誤訊息 dialog
  void showErrorDialog(
    ErrorDialogData data,
  ) {
    //addPostFrameCallback: 可以在 initState 中使用 dialog
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorDialog(data: data));
    });
  }
}
