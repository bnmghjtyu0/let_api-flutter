import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/app-icon.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/screens/food_delivery/main_food_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomAppBar(),
          Positioned(
              top: Dimensions(context).height(20) * 5,
              left: Dimensions(context).width(20),
              right: Dimensions(context).width(20),
              bottom: 0,
              child: MediaQuery.removePadding(
                  context: context,
                  child: Container(
                    margin:
                        EdgeInsets.only(top: Dimensions(context).height(15)),
                    child:
                        GetBuilder<CartController>(builder: (cartController) {
                      return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                              width: double.maxFinite,
                              height: Dimensions(context).height(20) * 5,
                              child: Row(children: [
                                //圖片
                                GestureDetector(
                                  onTap: () {
                                    print('tap');
                                    // var popularIndex =
                                    //     Get.find<PopularProductController>()
                                    //         .popularProductList
                                    //         .indexOf(cartController
                                    //             .getItems[index].product!);

                                    // //popular
                                    // if (popularIndex >= 0) {
                                    //   Get.toNamed(RouteHelper.getPopularFood(
                                    //       popularIndex, 'cartPage'));
                                    // }
                                    //recommend
                                    // else {
                                    // var recommendIndex =
                                    //     Get.find<RecommendProductController>()
                                    //         .recommendProductList
                                    //         .indexOf(cartController
                                    //             .getItems[index].product!);

                                    // Get.toNamed(RouteHelper.getRecommendFood(
                                    //     recommendIndex, 'cartPage'));
                                    // }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              Dimensions(context).height(10)),
                                      width: Dimensions(context).height(20) * 5,
                                      height:
                                          Dimensions(context).height(20) * 5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  AppConstants.BASE_URL +
                                                      AppConstants.UPLOAD_URL +
                                                      cartController
                                                          .getItems[index]
                                                          .img!)),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions(context).radius(20)),
                                          color: Colors.white)),
                                ),
                                SizedBox(
                                  width: Dimensions(context).width(10),
                                ),
                                Expanded(
                                    child: SizedBox(
                                        height:
                                            Dimensions(context).height(20) * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                                text: cartController
                                                    .getItems[index].name!,
                                                color: Colors.black54),
                                            SmallText(text: 'spicy'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                    text: cartController
                                                        .getItems[index].price
                                                        .toString(),
                                                    color: Colors.redAccent),
                                                // 計數器 + 0 -
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: Dimensions(context)
                                                          .height(10),
                                                      bottom:
                                                          Dimensions(context)
                                                              .height(10),
                                                      left: Dimensions(context)
                                                          .width(20),
                                                      right: Dimensions(context)
                                                          .width(20)),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  // child: GetBuilder<PopularProductController>(
                                                  //     builder:
                                                  //         (popularProduct) {
                                                  //   return Row(
                                                  //     children: [
                                                  //       GestureDetector(
                                                  //         onTap: (() {
                                                  //           popularProduct
                                                  //               .setQuantity(
                                                  //                   false);
                                                  //         }),
                                                  //         child: Icon(
                                                  //             Icons.remove,
                                                  //             color: AppColors
                                                  //                 .signColor),
                                                  //       ),
                                                  //       SizedBox(
                                                  //           width: Dimensions(
                                                  //                       context)
                                                  //                   .width(
                                                  //                       10) /
                                                  //               2),
                                                  //       BigText(
                                                  //           text: popularProduct
                                                  //               .inCartItems
                                                  //               .toString()),
                                                  //       SizedBox(
                                                  //           width: Dimensions(
                                                  //                       context)
                                                  //                   .width(
                                                  //                       10) /
                                                  //               2),
                                                  //       GestureDetector(
                                                  //         onTap: (() {
                                                  //           popularProduct
                                                  //               .setQuantity(
                                                  //                   true);
                                                  //         }),
                                                  //         child: Icon(
                                                  //             Icons.add,
                                                  //             color: AppColors
                                                  //                 .signColor),
                                                  //       )
                                                  //     ],
                                                  //   );
                                                  // })
                                                )
                                              ],
                                            )
                                          ],
                                        )))
                              ]));
                        },
                      );
                    }),
                  )))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
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
                    topLeft:
                        Radius.circular(Dimensions(context).radius(20) * 2),
                    topRight:
                        Radius.circular(Dimensions(context).radius(20) * 2))),
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
                        SizedBox(width: Dimensions(context).width(10) / 2),
                        BigText(
                            text:
                                '\$ ${cartController.totalAmount.toString()}'),
                        SizedBox(width: Dimensions(context).width(10) / 2),
                      ],
                    )),

                // price + Add to cart
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
                    child: BigText(text: 'Check out', color: Colors.white),
                  ),
                )
              ],
            ));
      }),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Dimensions(context).height(20) * 3,
        left: Dimensions(context).width(20),
        right: Dimensions(context).width(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: AppIcon(
                icon: Icons.arrow_back_ios,
                iconColor: AppColors.mainColor,
                iconSize: Dimensions(context).iconSize(24),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => MainFoodPage());
              },
              child: AppIcon(
                icon: Icons.home_outlined,
                iconColor: AppColors.mainColor,
                iconSize: Dimensions(context).iconSize(24),
              ),
            ),
            AppIcon(
              icon: Icons.shopping_cart,
              iconColor: AppColors.mainColor,
              iconSize: Dimensions(context).iconSize(24),
            )
          ],
        ));
  }
}
