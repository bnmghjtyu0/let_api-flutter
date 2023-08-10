// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';

//自定義的 icons
class AppLocalIcon extends StatelessWidget {
  const AppLocalIcon(this.icon, {Key? key, this.size = 22, this.color})
      : super(key: key);
  final EAppIcon icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    String i = describeEnum(icon).toLowerCase().replaceAll('_', '-');
    String path = 'assets/images/_common/icons/icon-$i.png';
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Image.asset(path,
            width: size,
            height: size,
            color: color ?? $styles.colors.white,
            filterQuality: FilterQuality.high),
      ),
    );
  }
}

enum EAppIcon {
  close,
  closeLarge,
  collection,
  download,
  expand,
  fullScreen,
  fullScreenExit,
  info,
  menu,
  nextLarge,
  north,
  prev,
  resetLocation,
  search,
  shardAndroid,
  shareIos,
  timeline,
  wallpaper,
  zoomIn,
  zoomOut
}
