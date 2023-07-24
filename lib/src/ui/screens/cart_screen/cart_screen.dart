import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_header.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';
import 'package:let_api_flutter/router.dart';

//購物車頁面
class CartScreen extends ConsumerStatefulWidget {
  //購物車頁面 - 建構式
  CartScreen({Key? key, required this.extra}) : super(key: key);

  //路由方法： go or push
  CartRouteExtraModel extra;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  int quantity = 0;

  goBack() {
    if (widget.extra.routeMethod == 'push') {
      GoRouter.of(context).pop();
    } else {
      GoRouter.of(context).go(ScreenPaths.home());
    }
  }

  @override
  Widget build(BuildContext context) {
    final popularApiData = ref.read(productPopularProvider);
    final recommendApiData = ref.read(productRecommendProvider).recommend;

    final cartState = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    void setQuantity(bool isIncrement, int cartQuantity, dynamic product) {
      quantity = 0;

      // 增加
      if (isIncrement) {
        if (cartNotifier.checkQuantify(context, cartQuantity, quantity + 1) ==
            null) return;
        setState(() {
          quantity =
              cartNotifier.checkQuantify(context, cartQuantity, quantity + 1)!;
        });
      }
      // 減少
      else {
        if (cartNotifier.checkQuantify(context, cartQuantity, quantity - 1) ==
            null) return;
        setState(() {
          quantity = cartNotifier.checkQuantify(context, cartQuantity, -1)!;
        });
      }
      cartNotifier.add(product, quantity);
    }

    return WillPopScope(
      onWillPop: () async {
        goBack();
        return false;
      },
      child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: Dimensions(context).height(0),
                left: Dimensions(context).width(0),
                right: Dimensions(context).width(0),
                child: AppHeader(
                  showCloseBtn: true,
                  isTransparent: true,
                  onClose: () {
                    goBack();
                  },
                ),
              ),
              // 商品列表
              Positioned(
                  top: Dimensions(context).height(20) * 5,
                  left: Dimensions(context).width(20),
                  right: Dimensions(context).width(20),
                  bottom: 0,
                  child: cartState.data.isNotEmpty
                      ? MediaQuery.removePadding(
                          context: context,
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions(context).height(15)),
                              child: ListView.builder(
                                itemCount: cartNotifier.getItems.length,
                                itemBuilder: (_, index) {
                                  final item = cartNotifier.getItems[index];
                                  final cartRefQuantity =
                                      Map.unmodifiable(cartState.data)[item.id]
                                          .quantity;

                                  return SizedBox(
                                      width: double.maxFinite,
                                      height:
                                          Dimensions(context).height(20) * 5,
                                      child: Row(children: [
                                        //圖片
                                        GestureDetector(
                                          onTap: () {
                                            var popularIndex = popularApiData
                                                .product?.products
                                                .indexWhere((value) =>
                                                    value.id ==
                                                    item.product.id);

                                            // 受歡迎商品
                                            if (popularIndex! >= 0) {
                                              GoRouter.of(context).go(
                                                  ScreenPaths.popularDetail(
                                                      popularIndex, item.id));
                                            }
                                            // 推薦商品
                                            else {
                                              var recommendIndex =
                                                  recommendApiData!
                                                      .products!
                                                      .indexWhere((value) =>
                                                          value.id ==
                                                          item.product.id);

                                              GoRouter.of(context).go(
                                                  ScreenPaths.recommendDetail(
                                                      recommendIndex, item.id));
                                            }
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: Dimensions(context)
                                                      .height(10)),
                                              width: Dimensions(context).height(20) *
                                                  5,
                                              height: Dimensions(context).height(20) *
                                                  5,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          ApiConstants.BASE_URL +
                                                              ApiConstants
                                                                  .UPLOAD_URL +
                                                              item.img)),
                                                  borderRadius:
                                                      BorderRadius.circular(Dimensions(context).radius(20)),
                                                  color: Colors.white)),
                                        ),
                                        SizedBox(
                                          width: Dimensions(context).width(10),
                                        ),
                                        Expanded(
                                            child: SizedBox(
                                                height: Dimensions(context)
                                                        .height(20) *
                                                    5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    BigText(
                                                        text: item.name,
                                                        color: Colors.black54),
                                                    // SmallText(text: 'spicy'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        BigText(
                                                            text:
                                                                '\$ ${cartNotifier.getItems[index].price}',
                                                            color: Colors
                                                                .redAccent),
                                                        // 計數器 + 0 -
                                                        Container(
                                                            padding: EdgeInsets.only(
                                                                top: Dimensions(context)
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
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius.circular(20)),
                                                            child: Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: (() {
                                                                    setQuantity(
                                                                        false,
                                                                        cartRefQuantity,
                                                                        item);
                                                                  }),
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: $styles
                                                                          .colors
                                                                          .signColor),
                                                                ),
                                                                SizedBox(
                                                                    width: Dimensions(context)
                                                                            .width(10) /
                                                                        2),
                                                                // 計數器的數字
                                                                BigText(
                                                                    text: Map.unmodifiable(
                                                                            cartState
                                                                                .data)[item
                                                                            .id]
                                                                        .quantity
                                                                        .toString()),
                                                                SizedBox(
                                                                    width: Dimensions(context)
                                                                            .width(10) /
                                                                        2),
                                                                GestureDetector(
                                                                  onTap: (() {
                                                                    setQuantity(
                                                                        true,
                                                                        cartRefQuantity,
                                                                        item);
                                                                  }),
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      color: $styles
                                                                          .colors
                                                                          .signColor),
                                                                )
                                                              ],
                                                            ))
                                                      ],
                                                    )
                                                  ],
                                                )))
                                      ]));
                                },
                              )))
                      : Center(child: Text('購物車內沒有商品')))
            ],
          ),
          bottomNavigationBar: cartState.data.isNotEmpty
              ? Container(
                  height: Dimensions(context).bottomHeightBar(),
                  padding: EdgeInsets.only(
                      top: Dimensions(context).height(30),
                      bottom: Dimensions(context).height(30),
                      left: Dimensions(context).height(20),
                      right: Dimensions(context).height(20)),
                  decoration: BoxDecoration(
                      color: $styles.colors.bottomBackgroundColor,
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
                              SizedBox(
                                  width: Dimensions(context).width(10) / 2),
                              BigText(
                                  text:
                                      '\$ ${cartNotifier.totalAmount.toString()}'),
                              SizedBox(
                                  width: Dimensions(context).width(10) / 2),
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
                            color: $styles.colors.mainColor,
                            borderRadius: BorderRadius.circular(
                                Dimensions(context).radius(20))),
                        // 結帳: 點結帳後，清空購物車的商品，加入歷史購買紀錄
                        child: GestureDetector(
                          onTap: (() {
                            //加入歷史購買紀錄，
                            cartNotifier.addToCartHistory();
                            //清空資料
                            cartNotifier.removeCart();
                            //回到首頁
                            GoRouter.of(context).go(ScreenPaths.home());
                          }),
                          child:
                              BigText(text: 'Check out', color: Colors.white),
                        ),
                      )
                    ],
                  ))
              : null),
    );
  }
}
