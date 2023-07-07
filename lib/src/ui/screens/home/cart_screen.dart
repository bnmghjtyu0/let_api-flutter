import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';
import 'package:let_api_flutter/src/router.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    final popularApiData = ref.watch(productPopularProvider);
    final recommendApiData = ref.watch(productRecommendProvider).recommend;
    final cartRef = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    final cartNotifierRef = ref.read(cartProvider.notifier);

    void setQuantity(bool isIncrement, int cartQuantity, dynamic product) {
      quantity = 0;
      // 增加
      if (isIncrement) {
        setState(() {
          quantity =
              cartNotifier.checkQuantify(context, cartQuantity, quantity + 1);
        });
      }
      // 減少
      else {
        setState(() {
          quantity =
              cartNotifier.checkQuantify(context, cartQuantity, quantity - 1);
        });
      }
      cartNotifier.add(product, quantity);
    }

    return Scaffold(
        body: Stack(
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
                          itemCount: cartNotifierRef.getItems.length,
                          itemBuilder: (_, index) {
                            final item = cartNotifierRef.getItems[index];
                            final cartRefQuantity =
                                Map.unmodifiable(cartRef.data)[item.id]
                                    .quantity;

                            return SizedBox(
                                width: double.maxFinite,
                                height: Dimensions(context).height(20) * 5,
                                child: Row(children: [
                                  //圖片
                                  GestureDetector(
                                    onTap: () {
                                      var popularIndex = popularApiData
                                          .product?.products
                                          .indexWhere((value) =>
                                              value.id == item.product.id);

                                      // 受歡迎商品
                                      if (popularIndex! >= 0) {
                                        GoRouter.of(context).go(
                                            ScreenPaths.foodDetail(
                                                popularIndex, item.id));
                                      }
                                      // 推薦商品
                                      else {
                                        var recommendIndex = recommendApiData!
                                            .products!
                                            .indexWhere((value) =>
                                                value.id == item.product.id);

                                        GoRouter.of(context).go(
                                            ScreenPaths.recommendDetail(
                                                recommendIndex, item.id));
                                      }
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            bottom:
                                                Dimensions(context).height(10)),
                                        width:
                                            Dimensions(context).height(20) * 5,
                                        height:
                                            Dimensions(context).height(20) * 5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(ApiConstants
                                                        .BASE_URL +
                                                    ApiConstants.UPLOAD_URL +
                                                    item.img)),
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
                                                          '\$ ${cartNotifierRef.getItems[index].price}',
                                                      color: Colors.redAccent),
                                                  // 計數器 + 0 -
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimensions(
                                                                  context)
                                                              .height(10),
                                                          bottom:
                                                              Dimensions(context)
                                                                  .height(10),
                                                          left:
                                                              Dimensions(context)
                                                                  .width(20),
                                                          right:
                                                              Dimensions(context)
                                                                  .width(20)),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20)),
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
                                                                Icons.remove,
                                                                color: $styles
                                                                    .colors
                                                                    .signColor),
                                                          ),
                                                          SizedBox(
                                                              width: Dimensions(
                                                                          context)
                                                                      .width(
                                                                          10) /
                                                                  2),
                                                          // 計數器的數字
                                                          BigText(
                                                              text: Map.unmodifiable(
                                                                      cartRef
                                                                          .data)[item
                                                                      .id]
                                                                  .quantity
                                                                  .toString()),
                                                          SizedBox(
                                                              width: Dimensions(
                                                                          context)
                                                                      .width(
                                                                          10) /
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
                        ))))
          ],
        ),
        bottomNavigationBar: Container(
            height: Dimensions(context).bottomHeightBar(),
            padding: EdgeInsets.only(
                top: Dimensions(context).height(30),
                bottom: Dimensions(context).height(30),
                left: Dimensions(context).height(20),
                right: Dimensions(context).height(20)),
            decoration: BoxDecoration(
                color: $styles.colors.bottomBackgroundColor,
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
                        BigText(
                            text: '\$ ${cartNotifier.totalAmount.toString()}'),
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
                    child: BigText(text: 'Check out', color: Colors.white),
                  ),
                )
              ],
            )));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
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
                  GoRouter.of(context).pop();
                },
                child: AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: $styles.colors.mainColor,
                  iconSize: Dimensions(context).iconSize(24),
                ),
              ),
              // 回首頁
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(ScreenPaths.home());
                },
                child: AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: $styles.colors.mainColor,
                  iconSize: Dimensions(context).iconSize(24),
                ),
              ),
              // 購物車
              AppIcon(
                icon: Icons.shopping_cart,
                iconColor: $styles.colors.mainColor,
                iconSize: Dimensions(context).iconSize(24),
              )
            ],
          ));
    });
  }
}
