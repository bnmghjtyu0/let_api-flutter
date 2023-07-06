import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/models/products_model.dart';
import 'package:let_api_flutter/src/router.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/ui/common/widgets/big_text.dart';
import 'package:let_api_flutter/src/ui/common/widgets/icon_and_text.dart';
import 'package:let_api_flutter/src/ui/common/widgets/small_text.dart';

///輪播圖
class PageViewItem extends StatelessWidget {
  int index;
  double currPageValue;
  ProductModel popularProduct;

  PageViewItem(
      {required this.index,
      required this.currPageValue,
      required this.popularProduct});

  double scaleFactor = 0.8;

  Matrix4 matrix = Matrix4.identity();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      double height = Dimensions(context).pageViewContainer();

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
            GestureDetector(
              onTap: (() {
                GoRouter.of(context)
                    .go(ScreenPaths.foodDetail(index, popularProduct.id!));
              }),
              child: Container(
                  height: Dimensions(context).pageViewContainer(),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions(context).radius(30)),
                      color: index.isEven ? AppColors.mainColor : Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ApiConstants.BASE_URL +
                              ApiConstants.UPLOAD_URL +
                              popularProduct.img!)))),
            ),

            //資訊區塊
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions(context).pageViewTextContainer(),
                  margin: EdgeInsets.only(
                      left: Dimensions(context).width(30),
                      right: Dimensions(context).width(30),
                      bottom: Dimensions(context).height(30)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions(context).radius(30)),
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
                          top: Dimensions(context).height(10),
                          left: Dimensions(context).width(15),
                          right: Dimensions(context).width(15)),
                      child: Column(children: [
                        BigText(text: 'Taiwan'),
                        SizedBox(height: Dimensions(context).height(10)),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(Icons.star,
                                        color: AppColors.mainColor))),
                            SizedBox(width: Dimensions(context).width(10)),
                            SmallText(text: '4.5'),
                            SizedBox(width: Dimensions(context).width(10)),
                            SmallText(text: '1287'),
                            SizedBox(width: Dimensions(context).width(10)),
                            SmallText(text: 'comments')
                          ],
                        ),
                        SizedBox(height: Dimensions(context).height(10)),
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
    });
  }
}
