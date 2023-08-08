import 'package:let_api_flutter/common_libs.dart';

class MlDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? yes;
  final String? no;
  final Function? yesOnPressed;
  final Function? noOnPressed;

  const MlDialog(
      {super.key,
      required this.title,
      required this.content,
      this.yes,
      this.no,
      this.yesOnPressed,
      this.noOnPressed});

  @override
  Widget build(BuildContext context) {
    return Theme(
      //dialog 背景色
      data: ThemeData(dialogBackgroundColor: Colors.white),
      child: Builder(builder: (context) {
        return Dialog(
          //dialog 圓角
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),

          //dialog 內容
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: $styles.text.h4.copyWith(
                        color: $styles.colors.mlDarker,
                        fontWeight: FontWeight.bold)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    height: 0,
                    thickness: 1,
                    color: $styles.colors.mlNormal,
                  ),
                ),
                Stack(
                  children: [
                    Text(content),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: OutlinedButton(
                        style: $styles.button.outlinePrimary,
                        child: Text('取消'),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: $styles.button.elevatedPrimary,
                        child: Text('確認'),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
