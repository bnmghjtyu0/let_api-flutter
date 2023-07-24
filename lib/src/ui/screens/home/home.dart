import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/models/products_model.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_header.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';
import 'package:let_api_flutter/src/ui/screens/home/widgets/page_view_item.dart';
import 'package:let_api_flutter/src/ui/screens/home/widgets/recommend_listview.dart';
import 'package:dots_indicator/dots_indicator.dart';

part './widgets/search_input.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final numLists = 1;
  //目前輪播位置
  var _currPageValue = 0.0;

  ///搜尋文字
  String _searchInputText = '';

  ///搜尋結果
  List<ProductModel> _searchResults = [];

  ///產品資料
  late List<ProductModel> productsData = [];

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

    /// 取得產品 api
    final Product? popularData = ref.read(productPopularProvider).product;
    productsData = popularData?.products ?? [];
    _searchResults = productsData;
  }

  void _handleSearchSubmitted(String query) {
    _searchInputText = query;
    _updateResults();
  }

  void _updateResults() {
    if (_searchInputText.isEmpty) {
      /// 取得產品 api
      _searchResults = productsData;
    } else {
      // whole word search on title and keywords.
      // this is a somewhat naive search, but is sufficient for demoing the UI.
      final RegExp q =
          RegExp('\\b${_searchInputText}s?\\b', caseSensitive: false);

      _searchResults =
          productsData.where((o) => o.name?.contains(q) ?? false).toList();
    }

    setState(() {});
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
                  Container(
                    child: _SearchInput(
                        onSubmit: _handleSearchSubmitted, wonder: productsData),
                  ),
                  //輪播區塊
                  _searchResults.isEmpty
                      ? Container(child: Text('找不到資料'))
                      : SizedBox(
                          height: Dimensions(context).pageView(),
                          child: PageView.builder(
                              controller: pageController,
                              itemCount: _searchResults.isEmpty
                                  ? 1
                                  : _searchResults.length,
                              itemBuilder: (BuildContext context, position) {
                                return PageViewItem(
                                    index: position,
                                    currPageValue: _currPageValue,
                                    popularProduct: _searchResults[position]);
                              })),

                  // 點點區塊
                  _searchResults.isEmpty
                      ? Container()
                      : DotsIndicator(
                          dotsCount: _searchResults.length,
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
