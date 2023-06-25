import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/services/api/recommend-http.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';

class RecommendDetailWidget extends StatelessWidget {
  final int pageId;

  const RecommendDetailWidget({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final recommend = ref.watch(recommendHttpProvider);
      return Scaffold(
          body: recommend.when(
              data: (recommendData) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      toolbarHeight: 70,
                      backgroundColor: AppColors.mainColor,
                      //上方區塊高度
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Image.network(
                              AppConstants.BASE_URL +
                                  AppConstants.UPLOAD_URL +
                                  recommendData.products![pageId].img!,
                              width: double.maxFinite,
                              fit: BoxFit.cover)),
                      title: CustomAppBar(
                        page: 'cartPage',
                      ),
                      //可浮動的標題
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(20),
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(top: 5, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        Dimensions(context).radius(20)),
                                    topRight: Radius.circular(
                                        Dimensions(context).radius(20)))),
                            child: Center(
                                child: BigText(
                                    size: Dimensions(context).fontSize(26),
                                    text: recommendData
                                        .products![pageId].name!))),
                      ),
                    ),
                    //內容
                    SliverToBoxAdapter(
                        child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: Dimensions(context).width(20),
                                right: Dimensions(context).width(20)),
                            child: ExpandableTextWidget(
                                text: recommendData
                                    .products![pageId].description
                                    .toString()))
                      ],
                    ))
                  ],
                );
              },
              error: ((error, stackTrace) => Text(error.toString())),
              loading: () {
                return Text('推薦目錄讀取中...');
              }));
      // bottomNavigationBar:
      //     GetBuilder<PopularProductController>(builder: (popularProduct) {
      //   return Column(mainAxisSize: MainAxisSize.min, children: [
      //     //計數區
      //     Container(
      //         padding: EdgeInsets.only(
      //           left: Dimensions(context).width(20) * 2.5,
      //           right: Dimensions(context).width(20) * 2.5,
      //           top: Dimensions(context).height(10),
      //           bottom: Dimensions(context).height(10),
      //         ),
      //         child: GetBuilder<PopularProductController>(
      //           builder: (controller) {
      //             return Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 GestureDetector(
      //                   onTap: () {
      //                     controller.setQuantity(false);
      //                   },
      //                   child: AppIcon(
      //                     iconColor: Colors.white,
      //                     icon: Icons.remove,
      //                     backgroundColor: AppColors.mainColor,
      //                     iconSize: Dimensions(context).iconSize(24),
      //                   ),
      //                 ),
      //                 BigText(
      //                   text: "12.88 X ${controller.quantity}",
      //                   color: Colors.black,
      //                   size: Dimensions(context).fontSize(26),
      //                 ),
      //                 GestureDetector(
      //                   onTap: () {
      //                     controller.setQuantity(true);
      //                   },
      //                   child: AppIcon(
      //                     iconColor: Colors.white,
      //                     icon: Icons.add,
      //                     backgroundColor: AppColors.mainColor,
      //                     iconSize: Dimensions(context).iconSize(24),
      //                   ),
      //                 )
      //               ],
      //             );
      //           },
      //         )),
      //     //灰底區塊
      //     Container(
      //         height: Dimensions(context).bottomHeightBar(),
      //         padding: EdgeInsets.only(
      //             top: Dimensions(context).height(30),
      //             bottom: Dimensions(context).height(30),
      //             left: Dimensions(context).height(20),
      //             right: Dimensions(context).height(20)),
      //         decoration: BoxDecoration(
      //             color: AppColors.bottomBackgroundColor,
      //             borderRadius: BorderRadius.only(
      //                 topLeft:
      //                     Radius.circular(Dimensions(context).radius(20) * 2),
      //                 topRight: Radius.circular(
      //                     Dimensions(context).radius(20) * 2))),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             // 計數器 + 0 -
      //             Container(
      //                 padding: EdgeInsets.only(
      //                     top: Dimensions(context).height(20),
      //                     bottom: Dimensions(context).height(20),
      //                     left: Dimensions(context).width(20),
      //                     right: Dimensions(context).width(20)),
      //                 decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(20)),
      //                 child: Icon(
      //                   Icons.favorite,
      //                   color: AppColors.signColor,
      //                 )),
      //             Container(
      //               padding: EdgeInsets.only(
      //                   top: Dimensions(context).height(20),
      //                   bottom: Dimensions(context).height(20),
      //                   left: Dimensions(context).width(20),
      //                   right: Dimensions(context).width(20)),
      //               decoration: BoxDecoration(
      //                   color: AppColors.mainColor,
      //                   borderRadius: BorderRadius.circular(
      //                       Dimensions(context).radius(20))),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   popularProduct.addItem(recommend);
      //                 },
      //                 child: BigText(
      //                     text: '\$ ${recommend.price} + Add to cart',
      //                     color: Colors.white),
      //               ),
      //             )
      //           ],
      //         ))
      //   ]);
      // }

      // ));
    });
  }
}

class CustomAppBar extends StatelessWidget {
  final String page;
  const CustomAppBar({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //cart icon
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: (() {
          GoRouter.of(context).goNamed(RouteNames.foodHome);
        }),
        child: Icon(Icons.clear),
      ),

      //cart icon
      // GetBuilder<PopularProductController>(builder: (controller) {
      //   return GestureDetector(
      //       onTap: () {
      //         if (page == 'cartPage') {
      //           Get.toNamed(RouteHelper.getCartPage());
      //         } else {
      //           Get.toNamed(RouteHelper.getInitial());
      //         }
      //       },
      //       child: Stack(children: [
      //         AppIcon(icon: Icons.shopping_cart_outlined),

      //         // cart number circle
      //         controller.totalItems >= 1
      //             ? Positioned(
      //                 top: 0,
      //                 right: 0,
      //                 child: AppIcon(
      //                   icon: Icons.circle,
      //                   size: 20,
      //                   iconColor: Colors.transparent,
      //                   backgroundColor: AppColors.mainColor,
      //                 ))
      //             : SizedBox(),

      //         // // cart number
      //         // controller.totalItems >= 1
      //         //     ? Positioned(
      //         //         top: 3,
      //         //         right: 3,
      //         //         child: SmallText(
      //         //           text: controller.totalItems.toString(),
      //         //           size: 10,
      //         //           color: Colors.white,
      //         //         ))
      //         //     : Positioned(
      //         //         top: 0,
      //         //         right: 0,
      //         //         child: SizedBox(
      //         //           width: 0,
      //         //           height: 0,
      //         //         )),
      //       ]));
      // })
    ]);
  }
}
