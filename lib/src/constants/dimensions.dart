import 'package:flutter/material.dart';

/// 定義響應式佈局
/// 如何使用？
/// Dimensions(context).height(66)
/// 假設寬度為 150 realSize 等於 844(螢幕高度) / 150
class Dimensions {
  final BuildContext context;
  Dimensions(this.context);

  Size displaySize() {
    return MediaQuery.of(context).size;
  }

  double col3() {
    double screenWidth = displaySize().width;
    return screenWidth / 4;
  }

  double col6() {
    double screenWidth = displaySize().width;
    return screenWidth / 2;
  }

  double col12() {
    double screenWidth = displaySize().width;
    return screenWidth / 1;
  }

  double height(double size) {
    double screenHeight = displaySize().height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double width(int size) {
    double screenWidth = displaySize().width;
    double realSize = 844 / size;
    return screenWidth / realSize;
  }

  double radius(double size) {
    double screenHeight = displaySize().height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double iconSize(int size) {
    double screenHeight = displaySize().height;
    double realSize = 844 / size;
    return screenHeight / realSize;
  }

  double bottomHeightBar() {
    double screenHeight = displaySize().height;
    return screenHeight / 7.03;
  }

  double popularFoodImgSize() {
    double screenHeight = displaySize().height;
    return screenHeight / 2.41;
  }

  double pageView() {
    double screenHeight = displaySize().height;
    return screenHeight / 2.64;
  }

  double pageViewContainer() {
    double screenHeight = displaySize().height;
    return screenHeight / 3.84;
  }

  double pageViewTextContainer() {
    double screenHeight = displaySize().height;
    return screenHeight / 7.03;
  }

  double listViewImageSize() {
    double screenWidth = displaySize().width;
    return screenWidth / 3.25;
  }

  double listViewTextContentSize() {
    double screenWidth = displaySize().width;
    return screenWidth / 3.9;
  }

  double splashImg() {
    double screenHeight = displaySize().height;
    return screenHeight / 3.37;
  }

  ///account avatar 手機
  double avatarXs() {
    double screenHeight = displaySize().height;
    double realSize = 844 / 200;
    return screenHeight / realSize;
  }

  ///account avatar 平板
  double avatarSm() {
    double screenHeight = displaySize().width;
    double realSize = 844 / 100;
    return screenHeight / realSize;
  }
}
