// ignore_for_file: library_private_types_in_public_api
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_api_flutter/common_libs.dart';
export 'colors.dart';

///樣式區 (文字大小、顏色、圓角、陰影)
@immutable
class AppStyle {
  /// 比例
  late final double scale;

  /// 顏色
  final AppColors colors = AppColors();

  /// 圓角
  late final _Rounded corners = _Rounded();

  /// 陰影
  late final _Shadows shadows = _Shadows();

  /// Padding and margin values
  late final _Insets insets = _Insets(scale);

  /// 文字樣式
  late final _Text text = _Text(scale);

  /// 按鈕樣式
  late final _Button button = _Button();

  /// 建構式
  AppStyle({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = .9; // phone
    } else {
      scale = .85; // small phone
    }
  }
}

///文字大小與樣式
@immutable
class _Text {
  _Text(this._scale);
  final double _scale;

  final Map<String, TextStyle> _titleFonts = {
    'en': TextStyle(fontFamily: 'Tenor'),
  };

  final Map<String, TextStyle> _contentFonts = {
    'en': TextStyle(fontFamily: 'Raleway', fontFeatures: const [
      FontFeature.enable('kern'),
    ]),
  };

  TextStyle _getFontForLocale(Map<String, TextStyle> fonts) {
    return fonts.entries.first.value;
  }

  TextStyle get titleFont => _getFontForLocale(_titleFonts);
  TextStyle get contentFont => _getFontForLocale(_contentFonts);
  late final TextStyle bodySmall =
      _createFont(contentFont, sizePx: 14, heightPx: 23);
  late final TextStyle h1 = _createFont(titleFont, sizePx: 64, heightPx: 62);
  late final TextStyle h2 = _createFont(titleFont, sizePx: 32, heightPx: 46);
  late final TextStyle h3 =
      _createFont(titleFont, sizePx: 24, heightPx: 36, weight: FontWeight.w500);
  late final TextStyle h4 = _createFont(contentFont,
      sizePx: 20, heightPx: 40, spacingPc: 5, weight: FontWeight.w600);

  late final TextStyle title1 =
      _createFont(titleFont, sizePx: 16, heightPx: 26, spacingPc: 5);
  late final TextStyle title2 =
      _createFont(titleFont, sizePx: 14, heightPx: 16.38);

  late final TextStyle bodyBold = _createFont(contentFont,
      sizePx: 16, heightPx: 26, weight: FontWeight.w600);

  late final TextStyle btn = _createFont(contentFont,
      sizePx: 14, weight: FontWeight.w500, spacingPc: 2, heightPx: 14);

  //一般大小
  late final TextStyle span =
      _createFont(contentFont, sizePx: 12, weight: FontWeight.w500);

  //客製化
  late final TextStyle fz20 =
      _createFont(contentFont, sizePx: 20, weight: FontWeight.w500);
  late final TextStyle fz26 =
      _createFont(contentFont, sizePx: 26, weight: FontWeight.w500);

  TextStyle _createFont(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    sizePx *= _scale;
    if (heightPx != null) {
      heightPx *= _scale;
    }
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight);
  }
}

class _Button {
  late final outlinePrimary =
      _createOutlinedButton($styles.colors.mlNormal, Colors.white);

  late final outlineWarning =
      _createOutlinedButton($styles.colors.mlWarning, Colors.white);

  late final elevatedPrimary =
      _createElevatedButton(Colors.white, $styles.colors.mlNormal);

  late final elevatedWarning =
      _createElevatedButton(Colors.white, $styles.colors.mlWarning);

  ButtonStyle _createElevatedButton(textColor, backgroundColor) {
    return ElevatedButton.styleFrom(
            // 邊框
            side: BorderSide(color: backgroundColor),
            //文字顏色
            foregroundColor: textColor,
            //陰影
            shadowColor: Colors.transparent,
            //背景色
            backgroundColor: backgroundColor,
            //內距
            padding: EdgeInsets.symmetric(horizontal: 32),
            //圓角
            shape: StadiumBorder(),
            textStyle: GoogleFonts.playfairDisplay(
                textStyle: const TextStyle(
                    //文字粗細
                    fontWeight: FontWeight.w700,
                    //文字大小
                    fontSize: 16)))
        .copyWith(
            //hover 背景顏色
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
      //hover 時的背景顏色
      if (states.contains(MaterialState.hovered)) {
        return null;
      } else {
        return $styles.colors.mlNormalHover;
      }
    }));
  }

  ButtonStyle _createOutlinedButton(textColor, backgroundColor) {
    return OutlinedButton.styleFrom(
        // 邊框
        side: BorderSide(color: textColor),
        //文字顏色
        foregroundColor: textColor,
        //內距
        padding: EdgeInsets.symmetric(horizontal: 32),
        //圓角
        shape: StadiumBorder(),
        // 文字樣式
        textStyle: GoogleFonts.playfairDisplay(
            textStyle: const TextStyle(
                //文字粗細
                fontWeight: FontWeight.w700,
                //文字大小
                fontSize: 16)));
  }
}

///圓角
@immutable
class _Rounded {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

@immutable
class _Insets {
  _Insets(this._scale);
  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 16 * _scale;
  late final double md = 24 * _scale;
  late final double lg = 32 * _scale;
  late final double xl = 48 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;
}

///陰影
@immutable
class _Shadows {
  final textSoft = [
    Shadow(
        color: Colors.black.withOpacity(.25),
        offset: Offset(0, 2),
        blurRadius: 4),
  ];
  final text = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: Offset(0, 2),
        blurRadius: 2),
  ];
  final textStrong = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: Offset(0, 4),
        blurRadius: 6),
  ];
}
