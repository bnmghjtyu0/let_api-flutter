// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:let_api_flutter/src/styles/themes/musiclight/widgets/buttons/elevated_button_theme.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/widgets/buttons/outlined_button_theme.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/widgets/buttons/text_button_theme.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/widgets/chip_theme.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/widgets/dialog_theme.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/widgets/input_decoration_theme.dart';
import 'package:let_api_flutter/src/styles/themes/musiclight/widgets/popup_menu_theme.dart';

//自定義 Material 主題
@immutable
class MaterialMusicLightTheme extends ThemeExtension<MaterialMusicLightTheme> {
  ///顏色
  static Color primaryColor = Color.fromRGBO(116, 201, 198, 1);
  static Color primaryDeepColor = const Color.fromRGBO(103, 178, 176, 1);
  static Color neutralColor = Color.fromRGBO(255, 255, 255, 1);
  static Color neutralColor10 = Color.fromRGBO(245, 245, 245, 1);
  static Color neutralColor30 = Color.fromRGBO(218, 218, 219, 1);
  static Color disabledColor = Color.fromRGBO(218, 218, 219, 1);
  static Color errorColor = Color.fromRGBO(255, 100, 100, 1);

  ///尺寸
  static double buttonFontSize = 16;

  ///建構式
  const MaterialMusicLightTheme();

  ///設定主題
  ThemeData init() {
    ///調色盤
    final colorScheme = const ColorScheme.light().copyWith(
        primary: primaryColor, error: errorColor, surface: Colors.white);

    ///判斷手機目前是否為淺色模式
    // final isLight = colorScheme.brightness == Brightness.light;
    return ThemeData(
        //設定字型
        fontFamily: 'NotoSansTC',

        //使用 Material 3 的樣式
        useMaterial3: true,
        extensions: [this],
        // material 色票
        colorScheme: colorScheme,
        // 鷹架
        scaffoldBackgroundColor: neutralColor,
        appBarTheme: AppBarTheme(backgroundColor: primaryColor),

        ///熱門搜尋的標籤
        chipTheme: chipTheme,

        ///按鈕
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
        textButtonTheme: textButtonTheme,

        // TextField 樣式
        inputDecorationTheme: inputDecorationTheme,

        // tab 樣式
        tabBarTheme: TabBarTheme(labelColor: Colors.white),

        // dialog 樣式
        dialogTheme: dialogTheme,

        // menu 樣式
        popupMenuTheme: popupMenuTheme);
  }

  @override
  ThemeExtension<MaterialMusicLightTheme> copyWith(
          {Color? primaryColor, Color? tertiaryColor, Color? neutralColor}) =>
      MaterialMusicLightTheme();

  ///動畫 Theme Extensions
  @override
  MaterialMusicLightTheme lerp(
      covariant ThemeExtension<MaterialMusicLightTheme>? other, double t) {
    return MaterialMusicLightTheme();
  }
}
