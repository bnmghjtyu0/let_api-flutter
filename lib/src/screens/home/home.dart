import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';
import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/models/recommend_model.dart';
import 'package:let_api_flutter/src/core/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/core/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/core/widgets/big_text.dart';
import 'package:let_api_flutter/src/core/widgets/small_text.dart';
import 'package:let_api_flutter/src/screens/home/widgets/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  //推薦商品清單
  List<SliverList> innerLists = [];
  final numLists = 1;
  //目前輪播位置
  var _currPageValue = 0.0;

  PageController pageController = PageController(
      //輪播圖間距
      viewportFraction: 0.82);

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });

    /** 取得推薦項目 api */
    final Recommend? recommendData =
        ref.read(productRecommendProvider).recommend;

    List<RecommendModel> recommendProducts = recommendData?.products ?? [];

    super.initState();
    final innerList = <RecommendRow>[];
    for (int j = 0; j < recommendProducts.length; j++) {
      innerList.add(RecommendRow(data: recommendProducts[j], index: j));
    }
    innerLists.add(
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => innerList[index],
          childCount: recommendProducts.length,
        ),
      ),
    );
  }

  /// 卸載資源
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);

    /// 取得產品 api
    final Product? popularData = ref.watch(productPopularProvider).product;

    return CustomScrollView(slivers: [
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
            expandedTitleScale: 1,
            title: Container(
                padding: EdgeInsets.only(
                    left: dimensions.width(20), right: dimensions.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      BigText(
                          text: 'Food Delivery', color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(
                            text: '一個美食外送平台',
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ]),
                    //搜尋框
                    Container(
                      width: dimensions.height(45),
                      height: dimensions.height(45),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimensions.radius(15)),
                          color: AppColors.mainColor),
                      child: Icon(Icons.search,
                          color: Colors.white, size: dimensions.iconSize(24)),
                    )
                  ],
                ))),
        // 使用 SliverAppBar
      ),
      SliverList(
          delegate: SliverChildListDelegate(
        [
          //body
          //SingleChildScrollView 可滾動
          Expanded(
            child: Column(
              children: [
                //輪播區塊
                SizedBox(
                    height: dimensions.pageView(),
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularData!.products.isEmpty
                            ? 1
                            : popularData.products.length,
                        itemBuilder: (BuildContext context, position) {
                          return PageViewItem(
                              index: position,
                              currPageValue: _currPageValue,
                              popularProduct: popularData.products[position]);
                        })),

                // 點點區塊
                Visibility(
                    child: DotsIndicator(
                        dotsCount: popularData.products.isEmpty
                            ? 1
                            : popularData.products.length,
                        position: _currPageValue,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeColor: AppColors.mainColor,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ))),
                SizedBox(height: dimensions.height(30)),
                // Popular title
                Container(
                  margin: EdgeInsets.only(
                      left: dimensions.width(30), right: dimensions.width(30)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BigText(text: 'Recommended'),
                        SizedBox(
                          width: dimensions.width(10),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 3),
                            child: Text('.')),
                        SizedBox(
                          width: dimensions.width(10),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: SmallText(text: 'Food paring'))
                      ]),
                ),
              ],
            ),
          )
        ],
      )),
      //推薦清單
      ...innerLists
    ]);
  }
}
