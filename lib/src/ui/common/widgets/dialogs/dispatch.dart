import 'package:flutter/scheduler.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/common/widgets/dialogs/error_dialog.dart';
import 'package:let_api_flutter/src/ui/common/widgets/dialogs/notification_dialog.dart';

class DialogHandlerConfig {
  bool useInit = false;
  DialogHandlerConfig(this.useInit);
}

///調用 dialog 的方法
class DialogHandler {
  final context = $context;

  ///調用推播 dialog
  void showNotificationDialog(NotificationDialogData data,
      {DialogHandlerConfig? config}) {
    ///如果在 initState 中使用
    if (config?.useInit == true) {
      //  addPostFrameCallback: 可以在 initState 中使用 dialog
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (BuildContext context) => NotificationDialog(data: data));
      });
    }

    ///點擊事件時使用
    else {
      showDialog(
          context: context,
          builder: (BuildContext context) => NotificationDialog(data: data));
    }
  }

  ///調用錯誤訊息 dialog
  void showErrorDialog(ErrorDialogData data, {DialogHandlerConfig? config}) {
    ///如果在 initState 中使用
    if (config?.useInit == true) {
      //  addPostFrameCallback: 可以在 initState 中使用 dialog
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorDialog(data: data));
      });
    }

    ///點擊事件時使用
    else {
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorDialog(data: data));
    }
  }
}
