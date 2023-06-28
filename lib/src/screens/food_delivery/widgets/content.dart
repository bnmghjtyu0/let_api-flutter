import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/app_provider.dart';
import 'package:let_api_flutter/src/core/services/api/popular-http.dart';
import 'package:let_api_flutter/src/core/services/api/recommend-http.dart';
import 'package:let_api_flutter/src/core/constants/colors.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/icon-and-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/page_view_item.dart';
import 'package:let_api_flutter/src/core/constants/dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';

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

  ///剛載入頁面時
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  /// 卸載資源
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /** 取得產品 api */
    final popularResult = ref.watch(popularHttpProvider);
    /** 取得推薦項目 api */
    final recommendResult = ref.watch(recommendHttpProvider);
    Dimensions dimensions = ref.watch(appProvider(context)).state.dimensions;

    return Column(children: [
      //輪播區塊
      popularResult.when(
          data: (popularProducts) {
            return SizedBox(
                height: dimensions.pageView(),
                child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.products.isEmpty
                        ? 1
                        : popularProducts.products.length,
                    itemBuilder: (BuildContext context, position) {
                      return popularProducts.products.isEmpty
                          ? Container()
                          : PageViewItem(
                              index: position,
                              currPageValue: _currPageValue,
                              popularProduct:
                                  popularProducts.products[position]);
                    }));
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () {
            return Text('產品目錄讀取中...');
          }),

      // 點點區塊
      popularResult.when(
          data: (popularData) {
            return DotsIndicator(
                dotsCount: popularData.products.isEmpty
                    ? 1
                    : popularData.products.length,
                position: _currPageValue,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeColor: AppColors.mainColor,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ));
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () {
            return Text('點點區塊讀取中...');
          }),
      SizedBox(height: dimensions.height(30)),
      // Popular title
      Container(
        margin: EdgeInsets.only(
            left: dimensions.width(30), right: dimensions.width(30)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          BigText(text: 'Recommended'),
          SizedBox(
            width: dimensions.width(10),
          ),
          Container(margin: EdgeInsets.only(bottom: 3), child: Text('.')),
          SizedBox(
            width: dimensions.width(10),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 2),
              child: SmallText(text: 'Food paring'))
        ]),
      ),

      recommendResult.when(
          data: (recommendData) {
            return ListView.builder(
                //physics: 設定滾動方式
                physics: NeverScrollableScrollPhysics(),
                //shrinkWrap: true: 無邊界, false: 根據父層高度設定邊界
                shrinkWrap: true,
                itemCount: recommendData.products!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (() {
                        GoRouter.of(context)
                            .go('/${RouteNames.recommendDetail}/$index');
                      }),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: dimensions.width(20),
                            right: dimensions.width(20),
                            bottom: dimensions.height(10)),
                        child: Row(children: [
                          //image section
                          Container(
                            width: dimensions.listViewImageSize(),
                            height: dimensions.listViewImageSize(),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendData.products![index].img!))),
                          ),
                          // text container
                          Expanded(
                            child: Container(
                                height: dimensions.listViewTextContentSize(),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            dimensions.radius(20)),
                                        bottomRight: Radius.circular(
                                            dimensions.radius(20)))),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: dimensions.width(10),
                                        right: dimensions.width(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BigText(
                                            text: recommendData
                                                .products![index].name!),
                                        SizedBox(height: dimensions.height(10)),
                                        SmallText(
                                            text: 'With Taiwan characteristic'),
                                        SizedBox(height: dimensions.height(10)),
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
                });
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () {
            return Text('推薦清單讀取中...');
          })
    ]);
  }
}
