import 'package:let_api_flutter/common_libs.dart';

///下拉刷新元件各頁面服務
class ScrollService {
  //首頁的 CustomScroll key
  late ScrollController scrollController;

  ///滑動至頁面頂端
  void scrollToTop(ScrollController contoller) {
    contoller.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }
}
