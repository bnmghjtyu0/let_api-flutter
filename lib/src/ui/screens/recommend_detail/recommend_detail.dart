import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/models/recommend_model.dart';
import 'package:let_api_flutter/src/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_header.dart';
import 'package:let_api_flutter/src/ui/common/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

class RecommendDetailWidget extends ConsumerStatefulWidget {
  final int index;
  final int pageId;

  const RecommendDetailWidget(
      {Key? key, required this.index, required this.pageId})
      : super(key: key);

  @override
  _RecommendDetailWidgetState createState() => _RecommendDetailWidgetState();
}

class _RecommendDetailWidgetState extends ConsumerState<RecommendDetailWidget> {
  int quantity = 0;
  final int _inCartItems = 0;
  int get inCartItems => _inCartItems;

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final recommendApiData = ref.watch(productRecommendProvider).recommend;

    final RecommendModel product =
        recommendApiData?.products?[widget.index] ?? RecommendModel();

    void setQuantity(bool isIncrement) {
      if (cartNotifier.checkQuantify(context, _inCartItems, quantity + 1) ==
          null) return;
      // 增加
      if (isIncrement) {
        setState(() {
          quantity =
              cartNotifier.checkQuantify(context, _inCartItems, quantity + 1)!;
        });
      }
      // 減少
      else {
        setState(() {
          quantity =
              cartNotifier.checkQuantify(context, _inCartItems, quantity - 1)!;
        });
      }
    }

    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 120,
              backgroundColor: $styles.colors.mainColor,
              //上方區塊高度
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                      ApiConstants.BASE_URL +
                          ApiConstants.UPLOAD_URL +
                          product.img!,
                      width: double.maxFinite,
                      fit: BoxFit.cover)),
              title: AppHeader(
                showBackBtn: true,
                isTransparent: true,
                showCartBtn: true,
                onCartPressed: () {
                  GoRouter.of(context).push(ScreenPaths.cartInfo(),
                      extra: CartRouteExtraModel(routeMethod: "push"));
                },
              ),

              // CustomAppBar(
              //     page: 'cartPage',
              //     totalItems: cartNotifier.totalItems.toString()),
              //可浮動的標題
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius(20)),
                            topRight: Radius.circular(Dimensions.radius(20)))),
                    child: Center(
                        child: Text(product.name!, style: $styles.text.fz26))),
              ),
            ),
            //內容
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width(20),
                        right: Dimensions.width(20)),
                    child: ExpandableTextWidget(text: product.description!))
              ],
            ))
          ],
        ),
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          //計數區
          Container(
              padding: EdgeInsets.only(
                left: Dimensions.width(20) * 2.5,
                right: Dimensions.width(20) * 2.5,
                top: Dimensions.height(10),
                bottom: Dimensions.height(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setQuantity(false);
                    },
                    child: AppIcon(
                      color: Colors.white,
                      icon: Icons.remove,
                      backgroundColor: $styles.colors.mainColor,
                      iconSize: Dimensions.iconSize(24),
                    ),
                  ),
                  Text("${product.price} X $quantity",
                      style: $styles.text.fz26.copyWith(color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      setQuantity(true);
                    },
                    child: AppIcon(
                      color: Colors.white,
                      icon: Icons.add,
                      backgroundColor: $styles.colors.mainColor,
                      iconSize: Dimensions.iconSize(24),
                    ),
                  )
                ],
              )),
          //灰底區塊
          Container(
              height: Dimensions.bottomHeightBar(),
              padding: EdgeInsets.only(
                  top: Dimensions.height(30),
                  bottom: Dimensions.height(30),
                  left: Dimensions.height(20),
                  right: Dimensions.height(20)),
              decoration: BoxDecoration(
                  color: $styles.colors.bottomBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius(20) * 2),
                      topRight: Radius.circular(Dimensions.radius(20) * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 計數器
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height(20),
                          bottom: Dimensions.height(20),
                          left: Dimensions.width(20),
                          right: Dimensions.width(20)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.favorite,
                        color: $styles.colors.signColor,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height(20),
                        bottom: Dimensions.height(20),
                        left: Dimensions.width(20),
                        right: Dimensions.width(20)),
                    decoration: BoxDecoration(
                        color: $styles.colors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius(20))),
                    child: GestureDetector(
                      onTap: () {
                        if (recommendApiData?.products != null) {
                          cartNotifier.add(product, quantity);
                          setState(() {
                            quantity = 0;
                          });
                        }
                      },
                      child: BigText(
                          text: '\$ ${product.price} + Add to cart',
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
  final String totalItems;
  const CustomAppBar({Key? key, required this.page, required this.totalItems})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return //cart icon
        Consumer(builder: (context, ref, child) {
      final cartData = ref.watch(cartProvider);
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: (() {
            GoRouter.of(context).go(ScreenPaths.home());
          }),
          child: Icon(Icons.clear),
        ),

        //cart icon
        GestureDetector(
            onTap: () {
              GoRouter.of(context).go(ScreenPaths.cartInfo());
              // if (page == 'cartPage') {
              //   Get.toNamed(RouteHelper.getCartPage());
              // } else {
              //   Get.toNamed(RouteHelper.getInitial());
              // }
            },
            child: Stack(children: [
              AppIcon(icon: Icons.shopping_cart_outlined),

              // cart number circle
              cartData.totalItems >= 1
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: AppIcon(
                        icon: Icons.circle,
                        size: 20,
                        color: Colors.transparent,
                        backgroundColor: $styles.colors.mainColor,
                      ))
                  : SizedBox(),
              cartData.totalItems >= 1
                  ? Positioned(
                      top: 3,
                      right: 3,
                      child: SmallText(
                        text: totalItems.toString(),
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
    });
  }
}
