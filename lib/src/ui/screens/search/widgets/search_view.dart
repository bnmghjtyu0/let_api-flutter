import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/services/product_popular_provider.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

///搜尋功能－顯示結果
class SearchView extends StatelessWidget {
  String inputText;
  OverlayEntry? overlay;
  SearchView({Key? key, required this.inputText, this.overlay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final product = ref.read(productPopularProvider).product?.products ?? [];
      final recommend =
          ref.read(productRecommendProvider).recommend?.products ?? [];

      final List<dynamic> data = [...product, ...recommend];
      data.retainWhere((data) =>
          data.name.toLowerCase().startsWith(inputText.toLowerCase()));

      data.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return Stack(children: [
        Container(
            margin: EdgeInsets.only(top: $styles.insets.xxs),
            width: double.infinity,
            height: double.infinity,
            child: Container(
                padding: EdgeInsets.all($styles.insets.xs),
                color: $styles.colors.white.withOpacity(0.98),
                child: ListView(children: [
                  for (int i = 0; i < data.length; i++)
                    _Row(
                        data: data[i],
                        index: i,
                        pageId: data[i]?.id ?? '',
                        overlay: overlay)
                ]))),
      ]);
    });
  }
}

class _Row extends StatelessWidget {
  final dynamic data;
  final int index;
  final int pageId;
  final OverlayEntry? overlay;

  const _Row(
      {required this.data,
      required this.index,
      required this.pageId,
      this.overlay});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          overlay?.remove();
          GoRouter.of(context).push(ScreenPaths.recommendDetail(index, pageId));
        }),
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions(context).width(20),
              right: Dimensions(context).width(20),
              bottom: Dimensions(context).height(10)),
          child: Row(children: [
            //image section
            SizedBox(
                width: Dimensions(context).listViewImageSize(),
                height: Dimensions(context).listViewImageSize(),
                child: Image.network(
                    ApiConstants.BASE_URL + ApiConstants.UPLOAD_URL + data.img!,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null);
                })),
            // text container
            Expanded(
              child: Container(
                  height: Dimensions(context).listViewTextContentSize(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight:
                              Radius.circular(Dimensions(context).radius(20)),
                          bottomRight:
                              Radius.circular(Dimensions(context).radius(20)))),
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions(context).width(10),
                          right: Dimensions(context).width(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: data.name!),
                          SizedBox(height: Dimensions(context).height(10)),
                          SmallText(text: 'With Taiwan characteristic'),
                          SizedBox(height: Dimensions(context).height(10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: data.price.toString() ?? '',
                                  iconColor: $styles.colors.mainColor),
                              IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: data.location ?? '',
                                  iconColor: $styles.colors.mainColor),
                              IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: '32min',
                                  iconColor: $styles.colors.mainColor)
                            ],
                          )
                        ],
                      ))),
            )
          ]),
        ));
  }
}
