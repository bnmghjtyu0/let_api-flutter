import 'package:let_api_flutter/common_libs.dart';

//使用 material icon
class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color? color;
  final double size;
  final double iconSize;

  const AppIcon({
    Key? key,
    required this.icon,
    this.color = const Color.fromARGB(255, 0, 0, 0),
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.size = 40,
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(size / 2), color: backgroundColor),
        child: Icon(
          icon,
          color: color,
          size: iconSize,
        ));
  }
}
