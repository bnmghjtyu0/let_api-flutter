import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/dimensions.dart';
import 'package:let_api_flutter/src/ui/common/widgets/icon_and_text.dart';
import 'package:let_api_flutter/src/ui/common/widgets/small_text.dart';

/// 資訊面板元件
class InfoColumn extends StatelessWidget {
  final String title;
  const InfoColumn({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: $styles.text.fz26),
        SizedBox(height: Dimensions.width(10)),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                    (index) =>
                        Icon(Icons.star, color: $styles.colors.mainColor))),
            SizedBox(width: Dimensions.width(10)),
            SmallText(text: '4.5'),
            SizedBox(width: Dimensions.width(10)),
            SmallText(text: '1287'),
            SizedBox(width: Dimensions.width(10)),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(height: Dimensions.width(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: $styles.colors.mainColor),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.7km',
                iconColor: $styles.colors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: $styles.colors.mainColor)
          ],
        )
      ]);
    });
  }
}
