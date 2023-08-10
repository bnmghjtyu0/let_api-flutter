// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/widgets/widgets.dart';

class ExpandableTextWidget extends ConsumerStatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  ConsumerState<ExpandableTextWidget> createState() =>
      _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends ConsumerState<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = 15;

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
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                Text(hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                    style: $styles.text.span),
                InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                            text: "Show more", color: $styles.colors.mainColor),
                        Icon(
                            hiddenText
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: $styles.colors.mainColor)
                      ],
                    ))
              ],
            ),
    );
  }
}
