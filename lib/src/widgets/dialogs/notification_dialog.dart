import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/widgets/dialogs/common/ml_dialog.dart';

///推播資料
class NotificationDialogData {
  ///推播標題
  String? title;

  ///推播內容
  String? content;

  ///推播動態資料
  Map<String, dynamic>? data;

  ///推播資料 - 建構式
  NotificationDialogData({this.title, this.content, this.data});
}

///推播 dialog
/// How to use?
/// $dialogDispatch.showNotificationDialog(
///   NotificationDialogData(title: '安安', content: '妳好')
/// );
class NotificationDialog extends StatelessWidget {
  ///推播資料
  NotificationDialogData data;

  ///推播 dialog - 建構式
  NotificationDialog({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MlDialog(
      title: data.title ?? '',
      content: data.content ?? '',
    );
  }
}
