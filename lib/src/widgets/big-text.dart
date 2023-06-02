import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final double? height;

  const BigText(
      {Key? key,
      this.color = Colors.black,
      required this.text,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'Roboto',
            color: color,
            fontSize: size == 0 ? Dimensions.font20 : size,
            height: height));
  }
}
