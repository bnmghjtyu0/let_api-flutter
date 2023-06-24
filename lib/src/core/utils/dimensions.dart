import 'package:flutter/material.dart';

///Dimensions(context).height(66)
class Dimensions {
  final BuildContext context;
  Dimensions(this.context);

  Size displaySize(context) {
    // debugPrint('Size = ${MediaQuery.of(context).size}');
    return MediaQuery.of(context).size;
  }

  double height(int size) {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double width(int size) {
    // debugPrint('Width = ${displaySize(context).width}');
    double screenWidth = displaySize(context).width;
    double realSize = 844 / size;
    return screenWidth / realSize;
  }

  double radius(int size) {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double iconSize(int size) {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double fontSize(int size) {
    debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double bottomHeightBar() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    return screenHeight / 7.03;
  }

  double popularFoodImgSize() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    return screenHeight / 2.41;
  }

  double pageView() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    return screenHeight / 2.64;
  }

  double pageViewContainer() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    return screenHeight / 3.84;
  }

  double pageViewTextContainer() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    return screenHeight / 7.03;
  }

  double listViewImageSize() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenWidth = displaySize(context).width;
    return screenWidth / 3.25;
  }

  double listViewTextContentSize() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenWidth = displaySize(context).width;
    return screenWidth / 3.9;
  }

  double splashImg() {
    // debugPrint('Height = ${displaySize(context).height}');
    double screenHeight = displaySize(context).height;
    return screenHeight / 3.37;
  }
}
