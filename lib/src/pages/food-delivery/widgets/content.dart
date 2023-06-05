import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/pages/food-delivery/widgets/page-view-item.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:let_api_flutter/src/widgets/icon-and-text.dart';
import 'package:let_api_flutter/src/widgets/small-text%20copy.dart';

class FoodDeliveryContent extends StatefulWidget {
  const FoodDeliveryContent({Key? key}) : super(key: key);

  @override
  _FoodDeliveryContentState createState() => _FoodDeliveryContentState();
}

class _FoodDeliveryContentState extends State<FoodDeliveryContent> {
  PageController pageController = PageController(
      //輪播圖間距
      viewportFraction: 0.82);
  //目前輪播位置
  var _currPageValue = 0.0;

//剛載入頁面時
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("current value is $_currPageValue");
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //輪播區塊
      SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (BuildContext context, position) {
                return pageViewItem(position, _currPageValue);
              })),

      // 點點區塊
      DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeColor: AppColors.mainColor,
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      SizedBox(height: Dimensions.height30),
      // Popular title
      Container(
        margin: EdgeInsets.only(
            left: Dimensions.width30, right: Dimensions.width30),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          BigText(text: 'Popular'),
          SizedBox(
            width: Dimensions.width10,
          ),
          Container(margin: EdgeInsets.only(bottom: 3), child: Text('.')),
          SizedBox(
            width: Dimensions.width10,
          ),
          Container(
              margin: EdgeInsets.only(bottom: 2),
              child: SmallText(text: 'Food paring'))
        ]),
      ),
      ListView.builder(
          //physics: 設定滾動方式
          physics: NeverScrollableScrollPhysics(),
          //shrinkWrap: true: 無邊界, false: 根據父層高度設定邊界
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              child: Row(children: [
                //image section
                Container(
                  width: Dimensions.listViewImageSize,
                  height: Dimensions.listViewImageSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/lake.jpg"))),
                ),
                // text container
                Expanded(
                  child: Container(
                      height: Dimensions.listViewTextContentSize,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius:
                          //     BorderRadius.circular(Dimensions.radius20)),

                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20))),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                  text:
                                      'Nutritious fruit meal in Taiwan Taiwan'),
                              SizedBox(height: Dimensions.height10),
                              SmallText(text: 'With Taiwan characteristic'),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ],
                          ))),
                )
              ]),
            );
          })
    ]);
  }
}
