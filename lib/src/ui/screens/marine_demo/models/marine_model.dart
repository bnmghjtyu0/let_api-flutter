// Package imports:
import 'package:latlong2/latlong.dart';

///海洋地圖資料
class MarineData {
  String shipId;

  ///0:起點, 1:停靠點, 2:行駛中, 3:終點
  num status;
  LatLng latlng;
  String shipName;

  ///行駛角度
  double? heading;
  double dtg;
  double sog;
  String direction;
  String position;

  MarineData(
      {required this.shipId,
      required this.status,
      required this.latlng,
      this.heading,
      required this.shipName,
      required this.dtg,
      required this.sog,
      required this.direction,
      required this.position});
}
