import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/ui/common/widgets/dialogs/base_dialog.dart';

class BaseDialogAction {
  static dynamic context;

  ///推播的 dialog
  static void notification(RemoteMessage message) {
    var baseDialog = BaseAlertDialog(
      title: message.notification?.title ?? '',
      content: message.notification?.body ?? '',
      yesOnPressed: () {
        print(message.data);
      },
      yes: "確定",
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }
}
