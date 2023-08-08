import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  LogoSize? size;
  AppLogo({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoSize = 40;
    if (size == LogoSize.loginLogo) {
      logoSize = 80;
    }
    return Image.asset(
      "assets/images/app_logo.png",
      width: logoSize,
      height: logoSize,
    );
  }
}

enum LogoSize { loginLogo }
