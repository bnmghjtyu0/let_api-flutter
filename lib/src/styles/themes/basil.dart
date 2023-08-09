import 'package:flutter/material.dart';

//自定義 Material 主題
@immutable
class MaterialBasilTheme extends ThemeExtension<MaterialBasilTheme> {
  ///主要顏色
  final Color primaryColor;
  final Color primaryDeepColor;

  ///中性色系 白色
  final Color neutralColor;
  final Color neutralColor10;
  final Color neutralColor30;

  ///禁止使用的顏色
  final Color disabledColor;
  // 錯誤訊息的顏色
  final Color errorColor;

  final double buttonFontSize = 16;

  const MaterialBasilTheme({
    ///主要色系
    this.primaryColor = const Color.fromRGBO(116, 201, 198, 1),

    //其他顏色
    this.primaryDeepColor = const Color.fromRGBO(103, 178, 176, 1),
    this.neutralColor = const Color.fromRGBO(255, 255, 255, 1),
    this.neutralColor10 = const Color.fromRGBO(245, 245, 245, 1),
    this.neutralColor30 = const Color.fromRGBO(218, 218, 219, 1),
    this.disabledColor = const Color.fromRGBO(218, 218, 219, 1),
    this.errorColor = const Color.fromRGBO(255, 100, 100, 1),
  });

  @override
  ThemeExtension<MaterialBasilTheme> copyWith(
          {Color? primaryColor, Color? tertiaryColor, Color? neutralColor}) =>
      MaterialBasilTheme(
          primaryColor: primaryColor ?? this.primaryColor,
          neutralColor: neutralColor ?? this.neutralColor);

  ///動畫 Theme Extensions
  @override
  MaterialBasilTheme lerp(
      covariant ThemeExtension<MaterialBasilTheme>? other, double t) {
    return MaterialBasilTheme();
  }

  ///Material3
  ThemeData toTheme() {
    ///調色盤
    final colorScheme = const ColorScheme.light().copyWith(
        primary: primaryColor, error: errorColor, surface: Colors.white);

    ///判斷手機目前是否為淺色模式
    // final isLight = colorScheme.brightness == Brightness.light;
    return ThemeData(
        fontFamily: 'NotoSansTC',
        useMaterial3: true,
        extensions: [this],
        //文字字型
        colorScheme: colorScheme,
        scaffoldBackgroundColor: neutralColor,
        appBarTheme: AppBarTheme(backgroundColor: neutralColor),

        ///熱門搜尋的標籤
        chipTheme: ChipThemeData(

            ///勾勾顏色
            checkmarkColor: Colors.white,
            elevation: 0,
            side: BorderSide(color: Colors.transparent),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            backgroundColor: neutralColor10,
            selectedColor: primaryColor),

        ///有底色的按鈕
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          // 陰影
          elevation: 0,
          textStyle: TextStyle(fontSize: buttonFontSize),
          backgroundColor: primaryColor,

          ///按鈕文字顏色
          foregroundColor: Colors.white,
          // 圓角
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(6))
        ).copyWith(overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
          //pressed
          if (states.contains(MaterialState.pressed)) {
            return primaryDeepColor;
          } else {
            return null;
          }
        }))),

        ///外框按鈕
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(fontSize: buttonFontSize))
              .copyWith(
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
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: buttonFontSize))),

        // TextField 樣式
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //預設樣式
          // enabledBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),

          errorStyle: TextStyle(fontSize: 16),
        ),

        //  dialog 樣式
        dialogTheme: DialogTheme(elevation: 0),
        popupMenuTheme: PopupMenuThemeData(elevation: 4));
  }
}
