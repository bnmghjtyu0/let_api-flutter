import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarPopup extends PopupRoute {
  @override
  final bool barrierDismissible;
  final Offset offset;
  final BuildContext anchorContext;
  final PreferredSizeWidget child;
  @override
  final Color? barrierColor;
  @override
  final Duration transitionDuration;
  final CalendarPopupMode mode;

  CalendarPopup({
    required this.anchorContext,
    required this.child,
    this.barrierDismissible = true,
    this.barrierColor,
    this.offset = Offset.zero,
    this.transitionDuration = const Duration(milliseconds: 300),
    CalendarPopupMode? mode,
  }) : mode = mode ?? _getMode(anchorContext);

  @override
  Animation<double>? get animation {
    final parent = super.animation;
    return parent != null
        ? CurvedAnimation(
            curve: Curves.easeOutCirc,
            reverseCurve: Curves.easeInCirc,
            parent: parent)
        : parent;
  }

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final anchorBox = anchorContext.findRenderObject() as RenderBox;
    final anchorOffset = anchorBox.localToGlobal(Offset.zero);
    final anchorSize = anchorBox.size;
    return LayoutBuilder(builder: (context, constraints) {
      double? top, bottom, left, right;
      if (mode == CalendarPopupMode.portrait) {
        top = anchorOffset.dy + anchorSize.height / 2;
        left = anchorOffset.dx +
            (anchorSize.width - child.preferredSize.width) / 2;
        if (top + child.preferredSize.height > constraints.maxHeight) {
          top = null;
          bottom = constraints.maxHeight -
              anchorOffset.dy -
              anchorSize.height / 2 +
              16;
        } else {
          top -= 16;
        }
        if (left.isNegative) {
          left = 16;
        } else {
          if (left + child.preferredSize.width > constraints.maxWidth) {
            left = null;
            right = anchorOffset.dx +
                anchorSize.width -
                (anchorSize.width - child.preferredSize.width) / 2;
            if (right > constraints.maxWidth) {
              right = 16;
            }
          }
        }
      } else {
        top = anchorOffset.dy +
            (anchorSize.height - child.preferredSize.height) / 2;
        left = anchorOffset.dx + anchorSize.width / 2;
        if (left + child.preferredSize.width > constraints.maxWidth) {
          left = null;
          right = constraints.maxWidth - anchorOffset.dx - anchorSize.width / 2;
        }
        if (top.isNegative) {
          top = 0;
        } else {
          if (top + child.preferredSize.height > constraints.maxHeight) {
            top = null;
            bottom = anchorOffset.dy +
                anchorSize.height -
                (anchorSize.height - child.preferredSize.height) / 2;
            if (bottom > constraints.maxHeight) {
              bottom = 32;
            } else {
              bottom += 16;
            }
          } else {
            top -= 16;
          }
        }
      }
      if (top != null) {
        top += offset.dy;
      } else if (bottom != null) {
        bottom -= offset.dy;
      }
      if (left != null) {
        left += offset.dx;
      } else if (right != null) {
        right -= offset.dx;
      }
      return Stack(
        children: [
          Positioned(
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            width: child.preferredSize.width,
            height: child.preferredSize.height,
            child: child,
          )
        ],
      );
    });
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, widget) {
        return Transform.translate(
          offset: Offset(0, animation.value * 16),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  static CalendarPopupMode _getMode(BuildContext anchorContext) {
    final screenSize = MediaQuery.of(anchorContext).size;
    return screenSize.height >= screenSize.width
        ? CalendarPopupMode.portrait
        : CalendarPopupMode.landscape;
  }
}

enum CalendarPopupMode { portrait, landscape }
