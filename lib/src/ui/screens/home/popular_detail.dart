import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/models/products_model.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/router.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_header.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';
import 'package:let_api_flutter/src/ui/screens/home/widgets/widgets.dart';
import 'package:let_api_flutter/common_libs.dart';

class PopularDetail extends ConsumerStatefulWidget {
  /// 索引
  final int index;

  /// 商品ID
  final int pageId;

  const PopularDetail({Key? key, required this.pageId, required this.index})
      : super(key: key);

  @override
  _PopularDetailState createState() => _PopularDetailState();
}

class _PopularDetailState extends ConsumerState<PopularDetail> {
  int quantity = 0;
  final int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;

  void _handleBackPressed() => GoRouter.of(context).go(ScreenPaths.home());

  @override
  Widget build(BuildContext context) {
    /** 取得產品 api */
    final Product? popularApiData = ref.watch(productPopularProvider).product;
    final cartNotifier = ref.read(cartProvider.notifier);
    final cartData = ref.watch(cartProvider);
    final ProductModel product = popularApiData!.products[widget.index];

    void setQuantity(bool isIncrement) {
      // 增加
      if (isIncrement) {
        setState(() {
          quantity =
              cartNotifier.checkQuantify(context, _inCartItems, quantity + 1);
        });
      }
      // 減少
      else {
        setState(() {
          quantity =
              cartNotifier.checkQuantify(context, _inCartItems, quantity - 1);
        });
      }
    }

    dynamic getQuantity() {
      return cartData.data.containsKey(widget.pageId)
          ? Map.unmodifiable(cartData.data)[widget.pageId].quantity
          : 0;
    }

    return Scaffold(
        body: Stack(children: [
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
                        image: NetworkImage((ApiConstants.BASE_URL +
                            ApiConstants.UPLOAD_URL +
                            product.img!)))),
              )),

          Positioned(
            top: Dimensions(context).height(40),
            left: Dimensions(context).width(0),
            right: Dimensions(context).width(0),
            child: AppHeader(
                isTransparent: true,
                // showBackBtn: true,
                onBack: _handleBackPressed,
                // 前往購物車
                trailing: (_) => GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(ScreenPaths.cartInfo());
                        // if (controller.totalItems >= 1) {
                        //   Get.toNamed(RouteHelper.getCartPage());
                        // }
                      },
                      child: Stack(children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        // 購物車圓形
                        Positioned(
                            top: 0,
                            right: 0,
                            child: AppIcon(
                              icon: Icons.circle,
                              size: 20,
                              iconColor: Colors.transparent,
                              backgroundColor: $styles.colors.mainColor,
                            )),
                        // 購物車數字
                        Positioned(
                            top: 3,
                            right: 3,
                            child: SmallText(
                              text: cartData.data.length.toString(),
                              size: 12,
                              color: Colors.white,
                            ))
                      ]),
                    )),
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
                          topLeft:
                              Radius.circular(Dimensions(context).radius(20)),
                          topRight:
                              Radius.circular(Dimensions(context).radius(20))),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoColumn(title: product.name!),
                      SizedBox(height: Dimensions(context).height(20)),
                      // Introduce
                      BigText(text: 'Introduce'),
                      // expandable text
                      Expanded(
                          child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: product.description!),
                      )),
                    ],
                  ))),
        ]),
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
                        GestureDetector(
                          onTap: (() {
                            setQuantity(false);
                          }),
                          child: Icon(Icons.remove,
                              color: $styles.colors.signColor),
                        ),
                        SizedBox(width: Dimensions(context).width(10) / 2),
                        BigText(text: '${quantity + getQuantity()}'),
                        SizedBox(width: Dimensions(context).width(10) / 2),
                        GestureDetector(
                          onTap: (() {
                            setQuantity(true);
                          }),
                          child:
                              Icon(Icons.add, color: $styles.colors.signColor),
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
                      color: $styles.colors.mainColor,
                      borderRadius: BorderRadius.circular(
                          Dimensions(context).radius(20))),
                  child: GestureDetector(
                    onTap: (() {
                      ref.read(cartProvider.notifier).add(product, inCartItems);
                      setState(() {
                        quantity = 0;
                      });
                    }),
                    child: BigText(
                        text: '\$ ${product.price!} + Add to cart',
                        color: Colors.white),
                  ),
                )
              ],
            )));
  }
}
