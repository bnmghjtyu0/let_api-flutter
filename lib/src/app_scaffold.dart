import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/styles/style.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_scroll_behavior.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  static AppStyle get style => _style;
  static final AppStyle _style = AppStyle();

  const AppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to the device size, and update AppStyle when it changes
    Size size = MediaQuery.of(context).size;
    // appLogic.handleAppSizeChanged();
    AppStyle(screenSize: size);

    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: child,
    );
  }
}
