import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/core/services/api/popular-http.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/app-icon.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/info_column.dart';

class PopularDetail extends StatelessWidget {
  final int pageId;
  const PopularDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final popularResult = ref.watch(popularHttpProvider);

      return Scaffold(
          body: popularResult.when(
              data: (popularData) {
                return Stack(children: [
                  //大圖
                  Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        //double.maxFinite: 最大值
                        width: double.maxFinite,
                        height: Dimensions(context).popularFoodImgSize(),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage((AppConstants.BASE_URL +
                                    AppConstants.UPLOAD_URL +
                                    popularData.products[pageId].img!)))),
                      )),
                  CustomAppBar(
                    page: 'cartPage',
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: Dimensions(context).popularFoodImgSize() - 20,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: Dimensions(context).width(20),
                              right: Dimensions(context).width(20),
                              top: Dimensions(context).height(20)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      Dimensions(context).radius(20)),
                                  topRight: Radius.circular(
                                      Dimensions(context).radius(20))),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoColumn(
                                  title: popularData.products[pageId].name!),
                              SizedBox(height: Dimensions(context).height(20)),
                              // Introduce
                              BigText(text: 'Introduce'),
                              // expandable text
                              Expanded(
                                  child: SingleChildScrollView(
                                child: ExpandableTextWidget(
                                    text: popularData
                                        .products[pageId].description!),
                              ))
                            ],
                          ))),
                ]);
              },
              error: ((error, stackTrace) => Text(error.toString())),
              loading: () {
                return Text('產品目錄讀取中...');
              }),
          bottomNavigationBar: popularResult.when(
              data: (productData) {
                return Container(
                    height: Dimensions(context).bottomHeightBar(),
                    padding: EdgeInsets.only(
                        top: Dimensions(context).height(30),
                        bottom: Dimensions(context).height(30),
                        left: Dimensions(context).height(20),
                        right: Dimensions(context).height(20)),
                    decoration: BoxDecoration(
                        color: AppColors.bottomBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                Dimensions(context).radius(20) * 2),
                            topRight: Radius.circular(
                                Dimensions(context).radius(20) * 2))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 計數器 + 0 -
                        Container(
                            padding: EdgeInsets.only(
                                top: Dimensions(context).height(20),
                                bottom: Dimensions(context).height(20),
                                left: Dimensions(context).width(20),
                                right: Dimensions(context).width(20)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    PopularProductController()
                                        .setQuantity(false);
                                  }),
                                  child: Icon(Icons.remove,
                                      color: AppColors.signColor),
                                ),
                                SizedBox(
                                    width: Dimensions(context).width(10) / 2),
                                BigText(
                                    text: PopularProductController()
                                        .inCartItems
                                        .toString()),
                                SizedBox(
                                    width: Dimensions(context).width(10) / 2),
                                GestureDetector(
                                  onTap: (() {
                                    PopularProductController()
                                        .setQuantity(true);
                                  }),
                                  child: Icon(Icons.add,
                                      color: AppColors.signColor),
                                )
                              ],
                            )),

                        // Add to cart
                        Container(
                          padding: EdgeInsets.only(
                              top: Dimensions(context).height(20),
                              bottom: Dimensions(context).height(20),
                              left: Dimensions(context).width(20),
                              right: Dimensions(context).width(20)),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(
                                  Dimensions(context).radius(20))),
                          child: GestureDetector(
                            onTap: (() {
                              // popularProduct.addItem(product);
                            }),
                            child: BigText(
                                text:
                                    '\$ ${productData.products[pageId].price!} + Add to cart',
                                color: Colors.white),
                          ),
                        )
                      ],
                    ));
              },
              error: ((error, stackTrace) => Text(error.toString())),
              loading: () {
                return Text('產品目錄讀取中...');
              }));
    });
  }
}

///客製化導覽列
class CustomAppBar extends StatelessWidget {
  final String page;
  const CustomAppBar({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //cart icon
        Positioned(
            top: Dimensions(context).height(45),
            left: Dimensions(context).width(20),
            right: Dimensions(context).width(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 回上一頁
                  GestureDetector(
                      onTap: () {
                        GoRouter.of(context).goNamed(RouteNames.foodHome);
                        // if (page == 'cartPage') {
                        //   Get.toNamed(RouteHelper.getCartPage());
                        // } else {
                        //   Get.toNamed(RouteHelper.getInitial());
                        // }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),

                  // 前往購物車 cart
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).goNamed(RouteNames.cartInfo);
                      // if (controller.totalItems >= 1) {
                      //   Get.toNamed(RouteHelper.getCartPage());
                      // }
                    },
                    child: Stack(children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      // cart number circle
                      // controller.totalItems >= 1
                      //     ? Positioned(
                      //         top: 0,
                      //         right: 0,
                      //         child: AppIcon(
                      //           icon: Icons.circle,
                      //           size: 20,
                      //           iconColor: Colors.transparent,
                      //           backgroundColor: AppColors.mainColor,
                      //         ))
                      Container(),
                      // cart number
                      // controller.totalItems >= 1
                      //     ? Positioned(
                      //         top: 3,
                      //         right: 3,
                      //         child: SmallText(
                      //           text: Get.find<PopularProductController>()
                      //               .totalItems
                      //               .toString(),
                      //           size: 12,
                      //           color: Colors.white,
                      //         ))
                      Container()
                    ]),
                  )
                ]));
  }
}
