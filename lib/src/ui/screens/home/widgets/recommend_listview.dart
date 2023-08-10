part of '../home.dart';

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
        delegate: SliverChildListDelegate(
          [
            Wrap(
              children: [
                for (int i = 0; i < innerList.length; i++)
                  SizedBox(
                    width: context.responsive(Dimensions.col12(),
                        lg: Dimensions.col6()),
                    child: innerList[i],
                  )
              ],
            )
          ],
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
              left: Dimensions.width(20),
              right: Dimensions.width(20),
              bottom: Dimensions.height(10)),
          child: Row(children: [
            //image section
            SizedBox(
                width: Dimensions.listViewImageSize(),
                height: Dimensions.listViewImageSize(),
                child: Image.network(
                    ApiConstants.baseUrl + ApiConstants.uploadUrl + data.img!,
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
                  height: Dimensions.listViewTextContentSize(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius(20)),
                          bottomRight: Radius.circular(Dimensions.radius(20)))),
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width(10),
                          right: Dimensions.width(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: data.name!),
                          SizedBox(height: Dimensions.height(10)),
                          SmallText(text: 'With Taiwan characteristic'),
                          SizedBox(height: Dimensions.height(10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: data.price.toString(),
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
