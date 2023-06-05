import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // 844/320 = 3.84 (螢幕高度/pageView高度)
  static double pageView = screenHeight / 2.64;
  // 844/220 = 3.84 (螢幕高度/pageView高度)
  static double pageViewContainer = screenHeight / 3.84;
  // 844/120 = 7.03 (螢幕高度/pageView高度)
  static double pageViewTextContainer = screenHeight / 7.03;

  // 高度, margin(top、bottom), padding(top、bottom) 844/10=84.4
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  // 寬度, margin(left, right), padding(left, right) 844/10=84.4
  static double width10 = screenWidth / 84.4;
  static double width15 = screenWidth / 56.27;
  static double width20 = screenWidth / 42.2;
  static double width30 = screenWidth / 28.13;
  static double width45 = screenWidth / 18.76;

  //fontSize 20 高度應該是 20 ，所以 844/20 = 42.2
  static double font20 = screenHeight / 42.2;

// radius
  static double radius15 = screenHeight / 56.26;
  //radius 20 高度應該是 20 ，所以 844/20 = 42.2
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // icons
  static double iconSize24 = screenHeight / 35.16;

  static double listViewImageSize = screenWidth / 3.25;
  static double listViewTextContentSize = screenWidth / 3.9;
}
