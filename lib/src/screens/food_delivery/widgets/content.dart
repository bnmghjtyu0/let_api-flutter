import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/core/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/page_view_item.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:let_api_flutter/src/routes/route_helper.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/icon-and-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';
import 'package:get/get.dart';

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
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //輪播區塊
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return SizedBox(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.isEmpty
                    ? 1
                    : popularProducts.popularProductList.length,
                itemBuilder: (BuildContext context, position) {
                  return popularProducts.popularProductList.isEmpty
                      ? Container()
                      : pageViewItem(position, _currPageValue,
                          popularProducts.popularProductList[position]);
                }));
      }),

      // 點點區塊
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty
              ? 1
              : popularProducts.popularProductList.length,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: AppColors.mainColor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),
      SizedBox(height: Dimensions.height30),
      // Popular title
      Container(
        margin: EdgeInsets.only(
            left: Dimensions.width30, right: Dimensions.width30),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          BigText(text: 'Recommended'),
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

      GetBuilder<RecommendProductController>(builder: (recommend) {
        return recommend.isLoaded
            ? ListView.builder(
                //physics: 設定滾動方式
                physics: NeverScrollableScrollPhysics(),
                //shrinkWrap: true: 無邊界, false: 根據父層高度設定邊界
                shrinkWrap: true,
                itemCount: recommend.recommendProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (() {
                        Get.toNamed(
                            RouteHelper.getRecommendFood(index, 'home'));
                      }),
                      child: Container(
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
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommend.recommendProductList[index]
                                            .img!))),
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
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20))),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        right: Dimensions.width10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BigText(
                                            text: recommend
                                                .recommendProductList[index]
                                                .name!),
                                        SizedBox(height: Dimensions.height10),
                                        SmallText(
                                            text: 'With Taiwan characteristic'),
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
                      ));
                })
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      })
    ]);
  }
}
