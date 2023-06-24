import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/services/api/popular-http.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/page_view_item.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';

class FoodDeliveryContent extends ConsumerStatefulWidget {
  const FoodDeliveryContent({Key? key}) : super(key: key);

  @override
  _FoodDeliveryContentState createState() => _FoodDeliveryContentState();
}

class _FoodDeliveryContentState extends ConsumerState<FoodDeliveryContent> {
  PageController pageController = PageController(
      //輪播圖間距
      viewportFraction: 0.82);
  //目前輪播位置
  var _currPageValue = 0.0;

//剛載入頁面時
  @override
  void initState() {
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
    final popularResult = ref.watch(popularHttpProvider);
    return Column(children: [
      //輪播區塊
      popularResult.when(
          data: (popularProducts) {
            print(popularProducts);
            return SizedBox(
                height: Dimensions(context).pageView(),
                child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.products.isEmpty
                        ? 1
                        : popularProducts.products.length,
                    itemBuilder: (BuildContext context, position) {
                      return popularProducts.products.isEmpty
                          ? Container()
                          : pageViewItem(context, position, _currPageValue,
                              popularProducts.products[0]);
                    }));
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () {
            return Text('loading');
          })

      // 點點區塊
      // GetBuilder<PopularProductController>(builder: (popularProducts) {
      //   return DotsIndicator(
      //     dotsCount: popularProducts.popularProductList.isEmpty
      //         ? 1
      //         : popularProducts.popularProductList.length,
      //     position: _currPageValue,
      //     decorator: DotsDecorator(
      //       size: const Size.square(9.0),
      //       activeSize: const Size(18.0, 9.0),
      //       activeColor: AppColors.mainColor,
      //       activeShape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(5.0)),
      //     ),
      //   );
      // }),
      // SizedBox(height: Dimensions(context).height(30)),
      // // Popular title
      // Container(
      //   margin: EdgeInsets.only(
      //       left: Dimensions(context).width(30),
      //       right: Dimensions(context).width(30)),
      //   child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      //     BigText(text: 'Recommended'),
      //     SizedBox(
      //       width: Dimensions(context).width(10),
      //     ),
      //     Container(margin: EdgeInsets.only(bottom: 3), child: Text('.')),
      //     SizedBox(
      //       width: Dimensions(context).width(10),
      //     ),
      //     Container(
      //         margin: EdgeInsets.only(bottom: 2),
      //         child: SmallText(text: 'Food paring'))
      //   ]),
      // ),

      // GetBuilder<RecommendProductController>(builder: (recommend) {
      //   return recommend.isLoaded
      //       ? ListView.builder(
      //           //physics: 設定滾動方式
      //           physics: NeverScrollableScrollPhysics(),
      //           //shrinkWrap: true: 無邊界, false: 根據父層高度設定邊界
      //           shrinkWrap: true,
      //           itemCount: recommend.recommendProductList.length,
      //           itemBuilder: (context, index) {
      //             return GestureDetector(
      //                 onTap: (() {
      //                   Get.toNamed(
      //                       RouteHelper.getRecommendFood(index, 'home'));
      //                 }),
      //                 child: Container(
      //                   margin: EdgeInsets.only(
      //                       left: Dimensions(context).width(20),
      //                       right: Dimensions(context).width(20),
      //                       bottom: Dimensions(context).height(10)),
      //                   child: Row(children: [
      //                     //image section
      //                     Container(
      //                       width: Dimensions(context).listViewImageSize(),
      //                       height: Dimensions(context).listViewImageSize(),
      //                       decoration: BoxDecoration(
      //                           image: DecorationImage(
      //                               fit: BoxFit.cover,
      //                               image: NetworkImage(AppConstants.BASE_URL +
      //                                   AppConstants.UPLOAD_URL +
      //                                   recommend.recommendProductList[index]
      //                                       .img!))),
      //                     ),
      //                     // text container
      //                     Expanded(
      //                       child: Container(
      //                           height: Dimensions(context)
      //                               .listViewTextContentSize(),
      //                           decoration: BoxDecoration(
      //                               color: Colors.white,
      //                               // borderRadius:
      //                               //     BorderRadius.circular(Dimensions(context).radius(20))),

      //                               borderRadius: BorderRadius.only(
      //                                   topRight: Radius.circular(
      //                                       Dimensions(context).radius(20)),
      //                                   bottomRight: Radius.circular(
      //                                       Dimensions(context).radius(20)))),
      //                           child: Padding(
      //                               padding: EdgeInsets.only(
      //                                   left: Dimensions(context).width(10),
      //                                   right: Dimensions(context).width(10)),
      //                               child: Column(
      //                                 crossAxisAlignment:
      //                                     CrossAxisAlignment.start,
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.center,
      //                                 children: [
      //                                   BigText(
      //                                       text: recommend
      //                                           .recommendProductList[index]
      //                                           .name!),
      //                                   SizedBox(
      //                                       height:
      //                                           Dimensions(context).height(10)),
      //                                   SmallText(
      //                                       text: 'With Taiwan characteristic'),
      //                                   SizedBox(
      //                                       height:
      //                                           Dimensions(context).height(10)),
      //                                   Row(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.spaceBetween,
      //                                     children: [
      //                                       IconAndTextWidget(
      //                                           icon: Icons.circle_sharp,
      //                                           text: 'Normal',
      //                                           iconColor: AppColors.mainColor),
      //                                       IconAndTextWidget(
      //                                           icon: Icons.location_on,
      //                                           text: '1.7km',
      //                                           iconColor: AppColors.mainColor),
      //                                       IconAndTextWidget(
      //                                           icon: Icons.access_time_rounded,
      //                                           text: '32min',
      //                                           iconColor: AppColors.mainColor)
      //                                     ],
      //                                   )
      //                                 ],
      //                               ))),
      //                     )
      //                   ]),
      //                 ));
      //           })
      //       : CircularProgressIndicator(
      //           color: AppColors.mainColor,
      //         );
      // })
    ]);
  }
}
