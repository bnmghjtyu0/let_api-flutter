import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String yes;
  final String? no;
  final Function yesOnPressed;
  final Function? noOnPressed;

  BaseAlertDialog(
      {required this.title,
      required this.content,
      required this.yes,
      this.no,
      required this.yesOnPressed,
      this.noOnPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: <Widget>[
        FloatingActionButton(
          // textColor: Colors.greenAccent,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
            yesOnPressed();
          },
          child: Text(yes),
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
