import 'package:flutter/material.dart';
import 'package:let_api_flutter/main.dart';

/// 定義響應式佈局
/// 如何使用？
/// Dimensions.height(66)
/// 假設寬度為 150 realSize 等於 844(螢幕高度) / 150
class Dimensions {
  static final double _width = MediaQuery.of($context).size.width;
  static final double _height = MediaQuery.of($context).size.height;

  static Size get displaySize => MediaQuery.of($context).size;

  static double col3() => _width / 4;

  static double col6() => _width / 2;

  static double col12() => _width / 1;

  static double radius(double size) {
    double realSize = 844 / size;
    return _height / realSize;
  }

  static double height(double size) {
    double realSize = 844 / size;
    return _height / realSize;
  }

  static double width(int size) {
    double realSize = 844 / size;
    return _width / realSize;
  }

  static double iconSize(int size) {
    double realSize = 844 / size;
    return _height / realSize;
  }

  static double bottomHeightBar() {
    return _height / 7.03;
  }

  static double popularFoodImgSize() {
    return _height / 2.41;
  }

  static double pageView() {
    return _height / 2.64;
  }

  static double pageViewContainer() {
    return _height / 3.84;
  }

  static double pageViewTextContainer() {
    return _height / 7.03;
  }

  static double listViewImageSize() {
    return _width / 3.25;
  }

  static double listViewTextContentSize() {
    return _width / 3.9;
  }

  static double splashImg() {
    return _height / 3.37;
  }

  ///account avatar 手機
  static double avatarXs() {
    double realSize = 844 / 200;
    return _height / realSize;
  }

  ///account avatar 平板
  static double avatarSm() {
    double realSize = 844 / 100;
    return _width / realSize;
  }
}
