import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/popular_provider.dart';
import 'package:let_api_flutter/src/core/services/api/popular-http.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/app-icon.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/info_column.dart';

class PopularDetail extends ConsumerStatefulWidget {
  final int pageId;

  const PopularDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  _PopularDetailState createState() => _PopularDetailState();
}

class _PopularDetailState extends ConsumerState<PopularDetail> {
  int quantity = 0;
  int _inCartItems = 0;
  get inCartItems => _inCartItems + quantity;

  @override
  Widget build(BuildContext context) {
    final popularHttpRef = ref.watch(popularHttpProvider);
    final popularRef = ref.watch(popularProvider.notifier);

    void setQuantity(bool isIncrement) {
      // 增加
      if (isIncrement) {
        setState(() {
          quantity =
              popularRef.checkQuantify(context, _inCartItems, quantity + 1);
        });
      }
      // 減少
      else {
        setState(() {
          quantity =
              popularRef.checkQuantify(context, _inCartItems, quantity - 1);
        });
      }
      print(inCartItems);
    }

    return Scaffold(
        body: popularHttpRef.when(
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
                                  popularData.products[widget.pageId].img!)))),
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
                                title:
                                    popularData.products[widget.pageId].name!),
                            SizedBox(height: Dimensions(context).height(20)),
                            // Introduce
                            BigText(text: 'Introduce'),
                            // expandable text
                            Expanded(
                                child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text: popularData
                                      .products[widget.pageId].description!),
                            )),
                          ],
                        ))),
              ]);
            },
            error: ((error, stackTrace) => Text(error.toString())),
            loading: () {
              return Text('產品目錄讀取中...');
            }),
        bottomNavigationBar: popularHttpRef.when(
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
                              GestureDetector(
                                onTap: (() {
                                  setQuantity(false);
                                }),
                                child: Icon(Icons.remove,
                                    color: AppColors.signColor),
                              ),
                              SizedBox(
                                  width: Dimensions(context).width(10) / 2),
                              BigText(text: quantity.toString()),
                              SizedBox(
                                  width: Dimensions(context).width(10) / 2),
                              GestureDetector(
                                onTap: (() {
                                  setQuantity(true);
                                }),
                                child:
                                    Icon(Icons.add, color: AppColors.signColor),
                              )
                            ],
                          )),

                      // 加入購物車
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
                            ref.read(popularProvider.notifier).add(
                                productData.products[widget.pageId],
                                inCartItems);
                          }),
                          child: BigText(
                              text:
                                  '\$ ${productData.products[widget.pageId].price!} + Add to cart',
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
  }
}

///客製化導覽列
class CustomAppBar extends StatelessWidget {
  final String page;
  const CustomAppBar({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //cart icon
        Consumer(
      builder: (context, ref, child) {
        final popularRef = ref.watch(popularProvider.notifier);
        return Positioned(
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
                    // 購物車數字 label
                    child: Stack(children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      // cart number circle
                      popularRef.totalItems >= 1
                          ? Positioned(
                              top: 0,
                              right: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                              ))
                          : Container(),
                      // cart number
                      popularRef.totalItems >= 1
                          ? Positioned(
                              top: 3,
                              right: 3,
                              child: SmallText(
                                text: popularRef.totalItems.toString(),
                                size: 12,
                                color: Colors.white,
                              ))
                          : Container()
                    ]),
                  )
                ]));
      },
    );
  }
}
