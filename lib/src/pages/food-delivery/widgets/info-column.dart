import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:let_api_flutter/src/widgets/icon-and-text.dart';
import 'package:let_api_flutter/src/widgets/small-text%20copy.dart';

/// 資訊面板元件
class InfoColumn extends StatelessWidget {
  final String title;
  const InfoColumn({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(text: title, size: Dimensions.font26),
      SizedBox(height: Dimensions.height10),
      Row(
        children: [
          Wrap(
              children: List.generate(
                  5, (index) => Icon(Icons.star, color: AppColors.mainColor))),
          SizedBox(width: Dimensions.width10),
          SmallText(text: '4.5'),
          SizedBox(width: Dimensions.width10),
          SmallText(text: '1287'),
          SizedBox(width: Dimensions.width10),
          SmallText(text: 'comments')
        ],
      ),
      SizedBox(height: Dimensions.height10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: AppColors.mainColor),
          IconAndTextWidget(
              icon: Icons.location_on,
              text: '1.7km',
              iconColor: AppColors.mainColor),
          IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: '32min',
              iconColor: AppColors.mainColor)
        ],
      )
    ]);
  }
}
