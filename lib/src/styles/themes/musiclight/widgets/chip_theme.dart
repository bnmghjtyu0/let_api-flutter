// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/musiclight_light.dart';

final neutralColor10 = MaterialMusicLightTheme.neutralColor10;
final primaryColor = MaterialMusicLightTheme.primaryColor;
final primaryDeepColor = MaterialMusicLightTheme.primaryDeepColor;
final disabledColor = MaterialMusicLightTheme.disabledColor;

final chipTheme = ChipThemeData(

    /// chip 勾勾顏色
    checkmarkColor: Colors.white,
    elevation: 0,
    side: BorderSide(color: Colors.transparent),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    backgroundColor: neutralColor10,
    selectedColor: primaryColor);
