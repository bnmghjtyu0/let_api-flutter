import 'package:flutter/material.dart';

/// 定義響應式佈局
/// 如何使用？
/// Dimensions(context).height(66)
class Dimensions {
  final BuildContext context;
  Dimensions(this.context);

  Size displaySize(context) {
    return MediaQuery.of(context).size;
  }

  double height(int size) {
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double width(int size) {
    double screenWidth = displaySize(context).width;
    double realSize = 844 / size;
    return screenWidth / realSize;
  }

  double radius(int size) {
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double iconSize(int size) {
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double fontSize(int size) {
    double screenHeight = displaySize(context).height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double bottomHeightBar() {
    double screenHeight = displaySize(context).height;
    return screenHeight / 7.03;
  }

  double popularFoodImgSize() {
    double screenHeight = displaySize(context).height;
    return screenHeight / 2.41;
  }

  double pageView() {
    double screenHeight = displaySize(context).height;
    return screenHeight / 2.64;
  }

  double pageViewContainer() {
    double screenHeight = displaySize(context).height;
    return screenHeight / 3.84;
  }

  double pageViewTextContainer() {
    double screenHeight = displaySize(context).height;
    return screenHeight / 7.03;
  }

  double listViewImageSize() {
    double screenWidth = displaySize(context).width;
    return screenWidth / 3.25;
  }

  double listViewTextContentSize() {
    double screenWidth = displaySize(context).width;
    return screenWidth / 3.9;
  }

  double splashImg() {
    double screenHeight = displaySize(context).height;
    return screenHeight / 3.37;
  }
}
