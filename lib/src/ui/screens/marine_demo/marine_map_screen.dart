// Dart imports:
import 'dart:math';

// Package imports:
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/screens/marine_demo/models/marine_model.dart';
import 'package:let_api_flutter/src/ui/screens/marine_demo/widgets/info_window.dart';
import 'package:let_api_flutter/src/ui/screens/marine_demo/widgets/marine_marker.dart';

///海洋地圖
class MarineMap extends StatefulWidget {
  const MarineMap({Key? key}) : super(key: key);

  @override
  State<MarineMap> createState() => MarineMapState();
}

class MarineMapState extends State<MarineMap> {
  ///視窗控制器
  late final PopupController _popupController;

  @override
  void initState() {
    super.initState();
    _popupController = PopupController();
  }

  /// 用兩點座標計算角度
  /// 座標1 [point1]、座標2 [point2] returns 角度
  double calculateAngleBetweenPoints(LatLng point1, LatLng point2) {
    double deltaX = point2.latitude - point1.latitude;
    double deltaY = point2.longitude - point1.longitude;
    return atan2(deltaY, deltaX);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        zoom: 8,
        center: LatLng(24.2186833, 120.2964254),

        ///禁止旋轉地圖
        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
        onTap: (tapPosition, point) => _popupController.hideAllPopups(),
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
          additionalOptions: const {
            'accessToken':
                'pk.eyJ1IjoiYm5tZ2hqdHl1IiwiYSI6ImNqaXBibmlwNzB5emMzb3Jma3F0eTJ1eW0ifQ.TVMMXYe6zpgsVvimgN4PXQ',
            'id': 'bnmghjtyu/cllbp7z8n00dm01pog1t01b5z'
          },
        ),
        // TileLayer(
        //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        //   userAgentPackageName: 'com-xx-xx',
        // ),
        PolylineLayer(
          polylineCulling: false,
          polylines: [
            for (int i = 0; i < shipData.length; i++)
              if (i + 1 <= shipData.length - 1)

                ///排除行駛中的
                if (shipData[i].status != 2 && shipData[i + 1].status != 2)
                  Polyline(
                      points: [shipData[i].latlng, shipData[i + 1].latlng],
                      color: shipData[i].shipId == '001'
                          ? Color.fromRGBO(200, 40, 44, 1)
                          : Colors.white,
                      strokeWidth: 3),
          ],
        ),

        ///點擊 marker 彈出視窗
        PopupMarkerLayer(
          options: PopupMarkerLayerOptions(
            popupController: _popupController,

            ///渲染 marker
            markers: <Marker>[
              for (int i = 0; i < shipData.length; i++)

                ///起點、終點、停靠點 marker
                if (shipData[i].status != 2)
                  MarineMarker(isNavigation: false, marineData: shipData[i])

                /// 行駛中的 marker
                else
                  MarineMarker(isNavigation: true, marineData: shipData[i]),
            ],

            ///彈窗設定
            popupDisplayOptions: PopupDisplayOptions(
              snap: PopupSnap.mapBottom,
              builder: (_, Marker marker) {
                if (marker is MarineMarker) {
                  return InfoWindow(marineData: marker.marineData);
                }
                return const Card(child: Text('Not a monument'));
              },
            ),
          ),
        ),
      ],
    );
  }
}

List<MarineData> shipData = [
  MarineData(
      shipId: "001",
      status: 0,
      latlng: LatLng(
        23.789582823471342,
        119.7269163795084,
      ),
      shipName: '台中港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "001",
      status: 1,
      latlng: LatLng(24.08095258591445, 119.57030843336219),
      shipName: '台中港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "001",
      status: 1,
      latlng: LatLng(24.99976167119548, 120.13274704620379),
      shipName: '台中港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "001",
      status: 3,
      latlng: LatLng(25.330964975713954, 119.9993371775625),
      shipName: '台中港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "001",
      status: 2,
      latlng: LatLng(24.609248, 119.891462),
      heading: 0.549297248413932,
      shipName: 'XIN YUAN CHUN',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "002",
      status: 0,
      latlng: LatLng(23.714614661206742, 119.71682376455956),
      shipName: '基隆港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "002",
      status: 1,
      latlng: LatLng(23.941854911716167, 119.89816709463503),
      shipName: '基隆港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "002",
      status: 1,
      latlng: LatLng(24.174025, 119.772969),
      shipName: '基隆港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "002",
      status: 3,
      latlng: LatLng(24.99279765377643, 120.30510336217358),
      shipName: '基隆港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "002",
      status: 1,
      latlng: LatLng(25.38205953183324, 120.00970874889876),
      shipName: '基隆港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
  MarineData(
      shipId: "002",
      status: 2,
      latlng: LatLng(24.355683, 119.889117),
      heading: 0.549297248413932,
      shipName: '基隆港',
      dtg: 688.0,
      sog: 15.3,
      direction: 'NNE',
      position: '7°15.162\'S 116°21.306\'E'),
];
