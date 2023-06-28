import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/notifiers/popular_notifier.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/popular_provider.dart';
import 'package:let_api_flutter/src/core/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';
import 'package:let_api_flutter/src/core/widgets/widgets.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/widgets.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';

class RecommendDetailWidget extends ConsumerStatefulWidget {
  final int pageId;

  const RecommendDetailWidget({Key? key, required this.pageId})
      : super(key: key);

  @override
  _RecommendDetailWidgetState createState() => _RecommendDetailWidgetState();
}

class _RecommendDetailWidgetState extends ConsumerState<RecommendDetailWidget> {
  int quantity = 0;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems;

  @override
  Widget build(BuildContext context) {
    final popularRef = ref.watch(popularProvider.notifier);
    final recommendData = ref.read(productRecommendProvider).recommend;
    Dimensions dimensions = Dimensions(context);

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
        body: CustomScrollView(
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
                      ApiConstants.BASE_URL +
                          ApiConstants.UPLOAD_URL +
                          recommendData!.products![widget.pageId].img!,
                      width: double.maxFinite,
                      fit: BoxFit.cover)),
              title: CustomAppBar(page: 'cartPage', popularRef: popularRef),
              //可浮動的標題
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(dimensions.radius(20)),
                            topRight: Radius.circular(dimensions.radius(20)))),
                    child: Center(
                        child: BigText(
                            size: dimensions.fontSize(26),
                            text:
                                recommendData.products![widget.pageId].name!))),
              ),
            ),
            //內容
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: dimensions.width(20),
                        right: dimensions.width(20)),
                    child: ExpandableTextWidget(
                        text: recommendData.products![widget.pageId].description
                            .toString()))
              ],
            ))
          ],
        ),
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          //計數區
          Container(
              padding: EdgeInsets.only(
                left: dimensions.width(20) * 2.5,
                right: dimensions.width(20) * 2.5,
                top: dimensions.height(10),
                bottom: dimensions.height(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setQuantity(false);
                    },
                    child: AppIcon(
                      iconColor: Colors.white,
                      icon: Icons.remove,
                      backgroundColor: AppColors.mainColor,
                      iconSize: dimensions.iconSize(24),
                    ),
                  ),
                  BigText(
                    text: "12.88 X $quantity",
                    color: Colors.black,
                    size: dimensions.fontSize(26),
                  ),
                  GestureDetector(
                    onTap: () {
                      setQuantity(true);
                    },
                    child: AppIcon(
                      iconColor: Colors.white,
                      icon: Icons.add,
                      backgroundColor: AppColors.mainColor,
                      iconSize: dimensions.iconSize(24),
                    ),
                  )
                ],
              )),
          //灰底區塊
          Container(
              height: dimensions.bottomHeightBar(),
              padding: EdgeInsets.only(
                  top: dimensions.height(30),
                  bottom: dimensions.height(30),
                  left: dimensions.height(20),
                  right: dimensions.height(20)),
              decoration: BoxDecoration(
                  color: AppColors.bottomBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimensions.radius(20) * 2),
                      topRight: Radius.circular(dimensions.radius(20) * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 計數器
                  Container(
                      padding: EdgeInsets.only(
                          top: dimensions.height(20),
                          bottom: dimensions.height(20),
                          left: dimensions.width(20),
                          right: dimensions.width(20)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.signColor,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: dimensions.height(20),
                        bottom: dimensions.height(20),
                        left: dimensions.width(20),
                        right: dimensions.width(20)),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(dimensions.radius(20))),
                    child: GestureDetector(
                      onTap: () {
                        // popularRef.add(
                        //     recommendData.products![widget.pageId],
                        //     quantity);
                      },
                      child: BigText(
                          text:
                              '\$ ${recommendData.products![widget.pageId].price} + Add to cart',
                          color: Colors.white),
                    ),
                  )
                ],
              ))
        ]));
  }
}

class CustomAppBar extends StatelessWidget {
  final String page;
  final PopularNotifier popularRef;
  const CustomAppBar({Key? key, required this.page, required this.popularRef})
      : super(key: key);

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
      GestureDetector(
          onTap: () {
            GoRouter.of(context).goNamed(RouteNames.cartInfo);
            // if (page == 'cartPage') {
            //   Get.toNamed(RouteHelper.getCartPage());
            // } else {
            //   Get.toNamed(RouteHelper.getInitial());
            // }
          },
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
                : SizedBox(),

            // // cart number
            popularRef.totalItems >= 1
                ? Positioned(
                    top: 3,
                    right: 3,
                    child: SmallText(
                      text: popularRef.totalItems.toString(),
                      size: 10,
                      color: Colors.white,
                    ))
                : Positioned(
                    top: 0,
                    right: 0,
                    child: SizedBox(
                      width: 0,
                      height: 0,
                    )),
          ]))
    ]);
  }
}
