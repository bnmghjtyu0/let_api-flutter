import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:let_api_flutter/src/widgets/icon-and-text.dart';
import 'package:let_api_flutter/src/widgets/small-text%20copy.dart';

Widget pageViewItem(int index, double currPageValue) {
  double scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  Matrix4 matrix = Matrix4.identity();
  //目前選擇的圖片
  if (index == currPageValue.floor()) {
    var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }
  //後一張圖片
  else if (index == currPageValue.floor() + 1) {
    var currScale =
        scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }
  //前一張圖片
  else if (index == currPageValue.floor() - 1) {
    var currScale = 0.8;
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else {
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, height * (1 - currScale) / 2, 1);
  }
  return Transform(
      transform: matrix,
      child: Stack(children: [
        //圖片
        Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? AppColors.mainColor : Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("images/lake.jpg")))),

        //資訊區塊
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: Column(children: [
                    BigText(text: 'Taiwan'),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    color: AppColors.mainColor))),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: '4.5'),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: '1287'),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: 'comments')
                      ],
                    ),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: '1.7km',
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconColor: AppColors.mainColor)
                      ],
                    )
                  ]))),
        )
      ]));
}
