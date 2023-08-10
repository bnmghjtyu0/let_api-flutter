// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/musiclight_light.dart';

final neutralColor10 = MaterialMusicLightTheme.neutralColor10;
final primaryColor = MaterialMusicLightTheme.primaryColor;
final primaryDeepColor = MaterialMusicLightTheme.primaryDeepColor;
final disabledColor = MaterialMusicLightTheme.disabledColor;

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom().copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(
            color: disabledColor,
            width: 2,
          );
        }
        return BorderSide(
          color: primaryColor,
          width: 2,
        );
        // Defer to the widget's default.
      },
    ),
  ),
);
