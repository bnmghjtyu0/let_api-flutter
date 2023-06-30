import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class AppScrollBehavior extends ScrollBehavior {
  @override
  // 加入滑鼠拖曳功能，方便網頁版測試
  Set<PointerDeviceKind> get dragDevices {
    final devices = Set<PointerDeviceKind>.from(super.dragDevices);
    if (kDebugMode) {
      devices.add(PointerDeviceKind.mouse);
    }
    return devices;
  }
}
