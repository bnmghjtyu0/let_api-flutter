import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/constants/colors.dart';
import 'package:let_api_flutter/src/core/constants/dimensions.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/app_provider.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';

class ExpandableTextWidget extends ConsumerStatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends ConsumerState<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = 15;
  // double textHeight = dimensions.height(15);

  @override
  void initState() {
    super.initState();
    //使用 widget 取得外層資料
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = ref.watch(appProvider(context)).state.dimensions;
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                  text:
                      hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                  size: dimensions.fontSize(16),
                  height: 1.8,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                            text: "Show more", color: AppColors.mainColor),
                        Icon(
                            hiddenText
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: AppColors.mainColor)
                      ],
                    ))
              ],
            ),
    );
  }
}
