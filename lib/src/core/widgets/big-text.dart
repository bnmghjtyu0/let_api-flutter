import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final double? height;
  final TextOverflow? overflow;

  const BigText(
      {Key? key,
      this.color = Colors.black,
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'Roboto',
            color: color,
            fontSize: size == 0 ? Dimensions(context).fontSize(20) : size,
            height: height,
            overflow: overflow));
  }
}
