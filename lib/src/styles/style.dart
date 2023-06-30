// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:let_api_flutter/common_libs.dart';

export 'colors.dart';

@immutable
class AppStyle {
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

  late final double scale;

  /// 顏色
  final AppColors colors = AppColors();

  /// 圓角
  late final _Rounded corners = _Rounded();

  ///陰影
  late final _Shadows shadows = _Shadows();

  /// Padding and margin values
  late final _Insets insets = _Insets(scale);

  /// 文字樣式
  late final _Text text = _Text(scale);
}

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

  late final TextStyle h1 = _createFont(titleFont, sizePx: 64, heightPx: 62);
  late final TextStyle h2 = _createFont(titleFont, sizePx: 32, heightPx: 46);
  late final TextStyle h3 =
      _createFont(titleFont, sizePx: 24, heightPx: 36, weight: FontWeight.w500);
  late final TextStyle h4 = _createFont(contentFont,
      sizePx: 14, heightPx: 23, spacingPc: 5, weight: FontWeight.w600);

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
