import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';
import 'package:let_api_flutter/src/core/models/recommend_model.dart';
import 'package:let_api_flutter/src/core/widgets/widgets.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';

@immutable
class RecommendRow extends StatefulWidget {
  final RecommendModel data;
  final int index;

  RecommendRow({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State createState() => _RecommendRowState();
}

class _RecommendRowState extends State<RecommendRow> {
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);
    return GestureDetector(
        onTap: (() {
          GoRouter.of(context)
              .go('/${RouteNames.recommendDetail}/${widget.index}');
        }),
        child: Container(
          margin: EdgeInsets.only(
              left: dimensions.width(20),
              right: dimensions.width(20),
              bottom: dimensions.height(10)),
          child: Row(children: [
            //image section
            Container(
              width: dimensions.listViewImageSize(),
              height: dimensions.listViewImageSize(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(ApiConstants.BASE_URL +
                          ApiConstants.UPLOAD_URL +
                          widget.data.img!))),
            ),
            // text container
            Expanded(
              child: Container(
                  height: dimensions.listViewTextContentSize(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(dimensions.radius(20)),
                          bottomRight: Radius.circular(dimensions.radius(20)))),
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: dimensions.width(10),
                          right: dimensions.width(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: widget.data.name!),
                          SizedBox(height: dimensions.height(10)),
                          SmallText(text: 'With Taiwan characteristic'),
                          SizedBox(height: dimensions.height(10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: widget.data.price.toString() ?? '',
                                  iconColor: AppColors.mainColor),
                              IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: widget.data.location ?? '',
                                  iconColor: AppColors.mainColor),
                              IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: '32min',
                                  iconColor: AppColors.mainColor)
                            ],
                          )
                        ],
                      ))),
            )
          ]),
        ));
  }
}
