import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/constants/colors.dart';
import 'package:let_api_flutter/src/core/constants/dimensions.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/app_provider.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/icon-and-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';

/// 資訊面板元件
class InfoColumn extends StatelessWidget {
  final String title;
  const InfoColumn({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      Dimensions dimensions = ref.watch(appProvider(context)).state.dimensions;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BigText(text: title, size: dimensions.fontSize(26)),
        SizedBox(height: dimensions.width(10)),
        Row(
          children: [
            Wrap(
                children: List.generate(5,
                    (index) => Icon(Icons.star, color: AppColors.mainColor))),
            SizedBox(width: dimensions.width(10)),
            SmallText(text: '4.5'),
            SizedBox(width: dimensions.width(10)),
            SmallText(text: '1287'),
            SizedBox(width: dimensions.width(10)),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(height: dimensions.width(10)),
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
    });
  }
}
