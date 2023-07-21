import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/router.dart';
import 'package:let_api_flutter/src/ui/common/widgets/circle_buttons.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

class AppHeader extends StatelessWidget {
  const AppHeader(
      {Key? key,
      //標題
      this.title,
      //副標題
      this.subtitle,
      //按鈕：回上一頁
      this.showBackBtn = false,
      //按鈕：關閉
      this.showCloseBtn = false,
      //按鈕：購物車
      this.showCartBtn = false,
      //背景：透明
      this.isTransparent = false,
      //背景：自定義
      this.backgroundColor = Colors.black,
      //Fn: 回上一頁的事件
      this.onBack,
      this.onClose,
      this.trailing,
      this.closeIcon = Icons.close,
      this.backIcon = Icons.navigate_before,
      this.backBtnSemantics,
      this.onCartPressed})
      : super(key: key);

  final String? title;
  final String? subtitle;
  final bool showBackBtn;
  final bool showCloseBtn;
  final bool showCartBtn;
  final dynamic closeIcon;
  final dynamic backIcon;
  final String? backBtnSemantics;
  final bool isTransparent;
  final Color backgroundColor;
  final VoidCallback? onCartPressed;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final Widget Function(BuildContext context)? trailing;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final cartNotifier = ref.read(cartProvider.notifier);
      return ColoredBox(
        color: isTransparent ? Colors.transparent : backgroundColor,
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            height: 64 * $styles.scale,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: $styles.insets.sm,
                          ),
                          if (showBackBtn)
                            CircleBtn(
                              onPressed: onBack,
                              icon: backIcon,
                              semanticLabel: backBtnSemantics,
                            ),
                          if (showCloseBtn)
                            CircleBtn(
                              onPressed: onClose,
                              icon: closeIcon,
                              semanticLabel: backBtnSemantics,
                            ),
                          if (trailing != null) trailing!.call(context),
                          Spacer(),
                          SizedBox(width: $styles.insets.sm),
                          if (showCartBtn)
                            GestureDetector(
                              onTap: onCartPressed ??
                                  () {
                                    CartRouteExtraModel extra =
                                        CartRouteExtraModel(routeMethod: 'go');
                                    GoRouter.of(context).go(
                                        ScreenPaths.cartInfo(),
                                        extra: extra);
                                  },
                              child: Stack(children: [
                                AppIcon(icon: Icons.shopping_cart_outlined),
                                // 購物車圓形
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      size: 20,
                                      color: Colors.transparent,
                                      backgroundColor: $styles.colors.mainColor,
                                    )),
                                // 購物車數字
                                Positioned(
                                    top: 3,
                                    right: 3,
                                    child: SmallText(
                                      text: cartNotifier.totalItems.toString(),
                                      size: 12,
                                      color: Colors.white,
                                    ))
                              ]),
                            ),
                          SizedBox(width: $styles.insets.sm),
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
    });
  }
}
