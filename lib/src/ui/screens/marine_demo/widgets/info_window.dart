// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/screens/marine_demo/models/marine_model.dart';
import 'package:let_api_flutter/src/ui/screens/marine_demo/styles/marine_style.dart';

///地圖資訊視窗
class InfoWindow extends StatelessWidget {
  MarineData marineData;
  InfoWindow({Key? key, required this.marineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              height: 150,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      marineData.shipName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        text: 'IMO ',
                        style: TextStyle(color: Colors.grey.shade500),
                        children: const <TextSpan>[
                          TextSpan(
                              text: '9211602',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //circle and line
                Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          color: MarineStyle.colorPrimary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                    ),
                    Expanded(
                        child: Divider(
                      height: 1,
                      color: MarineStyle.colorPrimary,
                    )),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          color: MarineStyle.colorPrimary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      'Singapor',
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'SAO LUIS',
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: 'AIS ET ',
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: '2022-11-23 07:50',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.grey.shade400)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: 'Predicated ETA ',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: '2022-11-22 05:30',
                            style: TextStyle(color: Colors.grey.shade400)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(color: MarineStyle.colorPrimary),
              child: Center(
                child: Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 3 / 12,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('DTG',
                                style: MarineStyle.textNormal
                                    .copyWith(color: Colors.white)),
                            Text(marineData.dtg.toString(),
                                style: MarineStyle.textNormal.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16))
                          ]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 3 / 12,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SOG',
                                style: MarineStyle.textNormal
                                    .copyWith(color: Colors.white)),
                            Text(marineData.sog.toString(),
                                style: MarineStyle.textNormal.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16))
                          ]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 3 / 12,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Direction',
                                style: MarineStyle.textNormal.copyWith(
                                  color: Colors.white,
                                )),
                            Text(marineData.direction,
                                style: MarineStyle.textNormal.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16))
                          ]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Position2',
                                style: MarineStyle.textNormal.copyWith(
                                  color: Colors.white,
                                )),
                            Text(marineData.position,
                                style: MarineStyle.textNormal.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16))
                          ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
