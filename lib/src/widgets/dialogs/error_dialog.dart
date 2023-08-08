import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/widgets/dialogs/common/base_dialog.dart';

///錯誤訊息資料
class ErrorDialogData {
  ///標題
  String? title;

  ///內容
  String? content;

  ///錯誤訊息資料 - 建構式
  ErrorDialogData({this.title, this.content});
}

class ErrorDialog extends StatelessWidget {
  ErrorDialogData? data;
  ErrorDialog({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: data?.title ?? '',
      content: data?.content ?? '',
      yesOnPressed: () {},
      yes: "確定",
    );
  }
}
