import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_icons.dart';
import 'package:let_api_flutter/src/ui/common/widgets/circle_buttons.dart';

class AppHeader extends StatelessWidget {
  const AppHeader(
      {Key? key,
      this.title,
      this.subtitle,
      this.showBackBtn = true,
      this.isTransparent = false,
      this.onBack,
      this.trailing,
      this.backIcon = EAppIcon.prev,
      this.backBtnSemantics})
      : super(key: key);
  final String? title;
  final String? subtitle;
  final bool showBackBtn;
  final EAppIcon backIcon;
  final String? backBtnSemantics;
  final bool isTransparent;
  final VoidCallback? onBack;
  final Widget Function(BuildContext context)? trailing;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isTransparent ? Colors.transparent : $styles.colors.black,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 64 * $styles.scale,
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Row(children: [
                    SizedBox(
                      width: $styles.insets.sm,
                    ),
                    if (showBackBtn)
                      BackBtn(
                        onPressed: onBack,
                        icon: backIcon,
                        semanticLabel: backBtnSemantics,
                      ),
                    Spacer(),
                    if (trailing != null) trailing!.call(context),
                    SizedBox(width: $styles.insets.sm),
                    //if (showBackBtn) Container(width: $styles.insets.lg * 2, alignment: Alignment.centerLeft, child: child),
                  ]),
                ),
              ),
              MergeSemantics(
                child: Semantics(
                  header: true,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (title != null)
                          Text(
                            title!.toUpperCase(),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            style: $styles.text.h4.copyWith(
                                color: $styles.colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        if (subtitle != null)
                          Text(
                            subtitle!.toUpperCase(),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            style: $styles.text.title1
                                .copyWith(color: $styles.colors.accent1),
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
