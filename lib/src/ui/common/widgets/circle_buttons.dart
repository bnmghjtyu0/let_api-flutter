import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

class CircleBtn extends StatelessWidget {
  final Color? color;
  final Color? bgColor;
  final IconData icon;
  final VoidCallback? onPressed;
  final String? semanticLabel;

  const CircleBtn({
    Key? key,
    this.color,
    this.icon = Icons.navigate_before,
    this.onPressed,
    this.semanticLabel,
    this.bgColor,
  }) : super(key: key);

  const CircleBtn.close(
      {Key? key, VoidCallback? onPressed, Color? bgColor, Color? iconColor})
      : this(
            key: key,
            icon: Icons.close,
            onPressed: onPressed,
            semanticLabel: 'close',
            bgColor: bgColor,
            color: iconColor);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ??
          () {
            print('pop');
            GoRouter.of(context).pop();
          },
      child: AppIcon(icon: icon, color: color ?? $styles.colors.black),
    );
  }

  Widget safe() => _SafeAreaWithPadding(child: this);
}

class _SafeAreaWithPadding extends StatelessWidget {
  const _SafeAreaWithPadding({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: child,
      ),
    );
  }
}
