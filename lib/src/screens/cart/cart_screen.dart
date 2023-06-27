import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/popular_provider.dart';
import 'package:let_api_flutter/src/core/services/api/popular-http.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/app-icon.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final popularHttpRef = ref.watch(popularHttpProvider).asData!.value;
          final popularRef = ref.watch(popularProvider.notifier);
          final cartRef = ref.read(cartProvider.notifier);
          return Stack(
            children: [
              CustomAppBar(),

              // 商品列表
              Positioned(
                  top: Dimensions(context).height(20) * 5,
                  left: Dimensions(context).width(20),
                  right: Dimensions(context).width(20),
                  bottom: 0,
                  child: MediaQuery.removePadding(
                      context: context,
                      child: Container(
                          margin: EdgeInsets.only(
                              top: Dimensions(context).height(15)),
                          child: ListView.builder(
                            itemCount: popularRef.getList.length,
                            itemBuilder: (_, index) {
                              return SizedBox(
                                  width: double.maxFinite,
                                  height: Dimensions(context).height(20) * 5,
                                  child: Row(children: [
                                    //圖片
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex = popularHttpRef
                                            .products
                                            .indexOf(popularRef
                                                .getList[index].product!);

                                        // 受歡迎商品
                                        if (popularIndex >= 0) {
                                          GoRouter.of(context).goNamed(
                                              RouteNames.foodDetail,
                                              pathParameters: {
                                                "pageId":
                                                    popularIndex.toString()
                                              });
                                        }
                                        // 推薦商品
                                        else {
                                          // var recommendIndex =
                                          //     Get.find<RecommendProductController>()
                                          //         .recommendProductList
                                          //         .indexOf(cartController
                                          //             .getItems[index].product!);

                                          // Get.toNamed(RouteHelper.getRecommendFood(
                                          //     recommendIndex, 'cartPage'));
                                        }
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: Dimensions(context)
                                                  .height(10)),
                                          width: Dimensions(context).height(20) *
                                              5,
                                          height:
                                              Dimensions(context).height(20) *
                                                  5,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(AppConstants.BASE_URL +
                                                      AppConstants.UPLOAD_URL +
                                                      popularRef.getList[index]
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
                                                Dimensions(context).height(20) *
                                                    5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                    text: popularRef
                                                        .getList[index].name!,
                                                    color: Colors.black54),
                                                SmallText(text: 'spicy'),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                        text: popularRef
                                                            .getList[index]
                                                            .price
                                                            .toString(),
                                                        color:
                                                            Colors.redAccent),
                                                    // 計數器 + 0 -
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimensions(
                                                                  context)
                                                              .height(10),
                                                          bottom: Dimensions(
                                                                  context)
                                                              .height(10),
                                                          left: Dimensions(
                                                                  context)
                                                              .width(20),
                                                          right: Dimensions(
                                                                  context)
                                                              .width(20)),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                          ))))
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        final cartRef = ref.read(cartProvider.notifier);
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
                // 計數器
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
                        BigText(text: '\$ ${cartRef.totalAmount.toString()}'),
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
            // 回上一頁
            GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed(RouteNames.foodDetail);
              },
              child: AppIcon(
                icon: Icons.arrow_back_ios,
                iconColor: AppColors.mainColor,
                iconSize: Dimensions(context).iconSize(24),
              ),
            ),
            // 回首頁
            GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed(RouteNames.foodHome);
              },
              child: AppIcon(
                icon: Icons.home_outlined,
                iconColor: AppColors.mainColor,
                iconSize: Dimensions(context).iconSize(24),
              ),
            ),
            // 購物車
            AppIcon(
              icon: Icons.shopping_cart,
              iconColor: AppColors.mainColor,
              iconSize: Dimensions(context).iconSize(24),
            )
          ],
        ));
  }
}
