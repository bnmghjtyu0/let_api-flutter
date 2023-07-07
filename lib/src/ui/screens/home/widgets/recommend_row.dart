import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/models/recommend_model.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';
import 'package:let_api_flutter/src/router.dart';

@immutable
class RecommendRow extends StatefulWidget {
  final RecommendModel data;
  final int index;
  final int pageId;

  const RecommendRow(
      {Key? key, required this.data, required this.index, required this.pageId})
      : super(key: key);

  @override
  State createState() => _RecommendRowState();
}

class _RecommendRowState extends State<RecommendRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          GoRouter.of(context)
              .go(ScreenPaths.recommendDetail(widget.index, widget.pageId));
        }),
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions(context).width(20),
              right: Dimensions(context).width(20),
              bottom: Dimensions(context).height(10)),
          child: Row(children: [
            //image section
            Container(
              width: Dimensions(context).listViewImageSize(),
              height: Dimensions(context).listViewImageSize(),
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
                          BigText(text: widget.data.name!),
                          SizedBox(height: Dimensions(context).height(10)),
                          SmallText(text: 'With Taiwan characteristic'),
                          SizedBox(height: Dimensions(context).height(10)),
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
