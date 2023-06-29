import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

//自定義 Material 主題
@immutable
class BasilTheme extends ThemeExtension<BasilTheme> {
  const BasilTheme({
    this.primaryColor = const Color(
      0xFF356859,
    ),
    this.tertiaryColor = const Color(0xffff5722),
    this.neutralColor = const Color(0xFFFFFFFF),
  });

  final Color primaryColor, tertiaryColor, neutralColor;

  //Theme Extensions
  @override
  ThemeExtension<BasilTheme> copyWith(
          {Color? primaryColor, Color? tertiaryColor, Color? neutralColor}) =>
      BasilTheme(
          primaryColor: primaryColor ?? this.primaryColor,
          tertiaryColor: tertiaryColor ?? this.tertiaryColor,
          neutralColor: neutralColor ?? this.neutralColor);

  ///動畫 Theme Extensions
  @override
  BasilTheme lerp(covariant ThemeExtension<BasilTheme>? other, double t) {
    if (other is! BasilTheme) return this;
    return BasilTheme(
        primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!);
  }

//調色盤 Material Color Utilities
  Scheme _scheme() {
    final base = CorePalette.of(primaryColor.value);
    final primary = base.primary;
    final tertiary = CorePalette.of(tertiaryColor.value).primary;
    final neutral = CorePalette.of(tertiaryColor.value).neutral;
    return Scheme(
        // --- 很單純的分隔線
        primary: primary.get(40),
        onPrimary: primary.get(40),
        primaryContainer: primary.get(40),
        onPrimaryContainer: primary.get(10),
        secondary: base.secondary.get(40),
        onSecondary: base.secondary.get(40),
        secondaryContainer: base.secondary.get(40),
        onSecondaryContainer: base.secondary.get(10),
        tertiary: tertiary.get(40),
        onTertiary: tertiary.get(40),
        tertiaryContainer: tertiary.get(40),
        onTertiaryContainer: tertiary.get(10),
        // --- 很單純的分隔線
        error: base.error.get(40),
        onError: base.error.get(100),
        errorContainer: base.error.get(90),
        onErrorContainer: base.error.get(10),
        background: neutral.get(40),
        onBackground: neutral.get(10),
        surface: neutral.get(99),
        onSurface: neutral.get(10),
        surfaceVariant: neutral.get(10),
        onSurfaceVariant: neutral.get(10),
        outline: base.neutralVariant.get(50),
        outlineVariant: base.neutralVariant.get(80),
        // --- 很單純的分隔線
        shadow: neutral.get(0),
        scrim: neutral.get(0),
        inverseSurface: neutral.get(20),
        inverseOnSurface: neutral.get(95),
        inversePrimary: primary.get(80));
  }

  ///基本設定
  ThemeData _base(ColorScheme colorScheme) {
    ///字型 Google Fonts
    final isLight = colorScheme.brightness == Brightness.light;

    return ThemeData(
      fontFamily: 'YsabeauOffice',
      useMaterial3: true,
      extensions: [this],
      //textTheme: 文字字型
      colorScheme: colorScheme,
      //scaffoldBackgroundColor: 鷹架背景顏色
      scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
      //appBarTheme: appBar 顏色
      appBarTheme: AppBarTheme(
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
      chipTheme: ChipThemeData(
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
    );
  }

  ///Material3
  ThemeData toThemeData() {
    final colorScheme = _scheme().toColorSheme(Brightness.light);
    return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
  }
}

///
/// @param brightness - 可傳入主體顏色
extension on Scheme {
  ColorScheme toColorSheme(Brightness brightness) {
    return ColorScheme(
        //brightness: 切換主題色 light/dark
        brightness: brightness,
        primary: Color(primary),
        onPrimary: Color(onPrimary),
        secondary: Color(secondary),
        onSecondary: Color(onSecondary),
        error: Color(error),
        onError: Color(onError),
        background: Color(background),
        onBackground: Color(onBackground),
        surface: Color(surface),
        onSurface: Color(onSurface));
  }
}
