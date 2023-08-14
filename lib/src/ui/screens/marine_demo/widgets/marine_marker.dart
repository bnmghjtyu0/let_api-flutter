// Package imports:
import 'package:flutter_map/plugin_api.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/screens/marine_demo/models/marine_model.dart';

///客製化地圖標誌
class MarineMarker extends Marker {
  final MarineData marineData;
  final bool? isNavigation;

  MarineMarker({required this.marineData, this.isNavigation})
      : super(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            point: marineData.latlng,
            builder: (context) {
              if (isNavigation == false || isNavigation == null) {
                return marineData.shipId == '001'
                    ? Icon(Icons.circle,
                        size: 12, color: Color.fromRGBO(0, 0, 183, 1))
                    : Icon(Icons.circle, size: 8, color: Colors.white);
              }
              return Transform.rotate(
                  angle: marineData.heading ?? 0,
                  child: Icon(Icons.navigation,
                      color: Color.fromRGBO(199, 157, 249, 1), size: 14));
            });
}
