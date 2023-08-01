// ignore_for_file: unused_local_variable

import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/extensions/responsive.dart';
import 'package:let_api_flutter/src/models/products_model.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/models/recommend_model.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_header.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';

part './widgets/recommend_listview.dart';
part './widgets/page_view_item.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final numLists = 1;
  //目前輪播位置
  var _currPageValue = 0.0;

  PageController pageController = PageController(
      //輪播圖間距
      viewportFraction: 0.82);

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  /// 卸載資源
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Future<void> _loadResource() async {
    await ref.read(productPopularProvider.notifier).loadProductPopular();
    await ref.read(productRecommendProvider.notifier).loadProductPopular();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productsData =
        ref.watch(productPopularProvider).product?.products ?? [];
    return RefreshIndicator(
        onRefresh: _loadResource,
        child: CustomScrollView(slivers: [
          SliverAppBar(
            shadowColor: Colors.black,
            //pinned 要固定在上面
            pinned: false,
            //snap: 搭配 floating 一起使用，往下滑動時顯示 AppBar
            snap: true,
            //floating: 搭配 snap 一起使用，往下滑動時顯示 AppBar
            floating: true,
            //展開的高度
            expandedHeight: 80.0,
            //收合的高度
            collapsedHeight: 80.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                ),
                expandedTitleScale: 1,
                title: AppHeader(
                  isTransparent: true,
                  showCartBtn: true,
                  onCartPressed: () {
                    GoRouter.of(context).go(ScreenPaths.cartInfo(),
                        extra: CartRouteExtraModel(routeMethod: "go"));
                  },
                  trailing: (context) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BigText(
                              text: 'Food Delivery',
                              color: $styles.colors.mainColor),
                          Row(
                            children: const [
                              SmallText(
                                text: '一個美食外送平台',
                              ),
                              Icon(Icons.arrow_drop_down_rounded),
                            ],
                          ),
                        ]);
                  },
                )),
            // 使用 SliverAppBar
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              //body
              //SingleChildScrollView 可滾動
              Column(
                children: [
                  //輪播區塊
                  productsData.isEmpty
                      ? Container(child: Text('找不到資料'))
                      : SizedBox(
                          height: Dimensions(context).pageView(),
                          child: PageView.builder(
                              controller: pageController,
                              itemCount: productsData.isEmpty
                                  ? 1
                                  : productsData.length,
                              itemBuilder: (BuildContext context, position) {
                                return PageViewItem(
                                    index: position,
                                    currPageValue: _currPageValue,
                                    popularProduct: productsData[position]);
                              })),

                  // 點點區塊
                  productsData.isEmpty
                      ? Container()
                      : DotsIndicator(
                          dotsCount: productsData.length,
                          position: _currPageValue,
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeColor: $styles.colors.mainColor,
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          )),

                  SizedBox(height: Dimensions(context).height(30)),
                  // Popular title
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions(context).width(30),
                        right: Dimensions(context).width(30)),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Recommend', style: $styles.text.h3),
                          SizedBox(
                            width: Dimensions(context).width(10),
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Text('.')),
                          SizedBox(
                            width: Dimensions(context).width(10),
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 2),
                              child:
                                  Text('Food paring', style: $styles.text.span))
                        ]),
                  ),
                ],
              )
            ],
          )),
          //推薦清單

          RecommendListView()
        ]));
  }
}
