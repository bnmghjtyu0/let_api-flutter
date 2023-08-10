// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/musiclight_light.dart';

final neutralColor10 = MaterialMusicLightTheme.neutralColor10;
final primaryColor = MaterialMusicLightTheme.primaryColor;
final primaryDeepColor = MaterialMusicLightTheme.primaryDeepColor;
final disabledColor = MaterialMusicLightTheme.disabledColor;

final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  // 陰影
  elevation: 0,
  // textStyle: TextStyle(fontSize: buttonFontSize),
  backgroundColor: primaryColor,

  ///按鈕文字顏色
  foregroundColor: Colors.white,
  // 圓角
  // shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(6))
).copyWith(overlayColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
  //pressed
  if (states.contains(MaterialState.pressed)) {
    return primaryDeepColor;
  } else {
    return null;
  }
})));
