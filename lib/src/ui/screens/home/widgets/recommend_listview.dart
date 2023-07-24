import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/models/recommend_model.dart';
import 'package:let_api_flutter/src/services/product_recommend_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

///推薦列表
class RecommendListView extends StatelessWidget {
  const RecommendListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final innerList = <RecommendRow>[];

    return Consumer(builder: (context, ref, child) {
      /** 取得推薦項目 api */
      final Recommend? recommendData =
          ref.read(productRecommendProvider).recommend;

      List<RecommendModel> recommendProducts = recommendData?.products ?? [];

      for (int j = 0; j < recommendProducts.length; j++) {
        innerList.add(RecommendRow(
            data: recommendProducts[j],
            index: j,
            pageId: recommendProducts[j].id!));
      }

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) =>
              innerList.isEmpty ? null : innerList[index],
          childCount: recommendProducts.length,
        ),
      );
    });
  }
}

class RecommendRow extends StatelessWidget {
  final RecommendModel data;
  final int index;
  final int pageId;

  const RecommendRow(
      {Key? key, required this.data, required this.index, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
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
