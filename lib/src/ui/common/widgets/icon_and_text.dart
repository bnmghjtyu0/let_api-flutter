import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(children: [
        Icon(icon, color: iconColor),
        SizedBox(width: 5),
        Flexible(
            child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            overflow: TextOverflow.clip,
            fontSize: 12,
            color: Color(0xFF212121),
            fontWeight: FontWeight.bold,
          ),
        ))
      ]),
    );
  }
}
