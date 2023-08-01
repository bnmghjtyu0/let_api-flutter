import 'package:let_api_flutter/common_libs.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? yes;
  final String? no;
  final Function? yesOnPressed;
  final Function? noOnPressed;

  const BaseDialog(
      {super.key,
      required this.title,
      required this.content,
      this.yes,
      this.no,
      this.yesOnPressed,
      this.noOnPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: $styles.colors.white,
      title: Text(title),
      content: Text(content),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: <Widget>[
        FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: Text(
            yes ?? '確定',
            style: TextStyle(color: $styles.colors.white),
          ),
        ),
        Visibility(
            visible: no != null && noOnPressed != null,
            child: FloatingActionButton(
              onPressed: () {
                noOnPressed!();
              },
              child: Text(no ?? ''),
            ))
      ],
    );
  }
}
