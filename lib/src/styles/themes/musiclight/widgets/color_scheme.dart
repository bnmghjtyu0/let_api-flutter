// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/musiclight_light.dart';

final neutralColor10 = MaterialMusicLightTheme.neutralColor10;
final primaryColor = MaterialMusicLightTheme.primaryColor;
final primaryDeepColor = MaterialMusicLightTheme.primaryDeepColor;
final disabledColor = MaterialMusicLightTheme.disabledColor;

final colorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,

    ///每個元件內的 elevated 都會吃到這個顏色
    surfaceTint: Colors.white);
