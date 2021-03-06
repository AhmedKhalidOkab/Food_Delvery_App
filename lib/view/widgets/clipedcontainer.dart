import 'package:delivery_/core/animations/animations.dart';
import 'package:delivery_/core/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class ClippedContainer extends StatelessWidget {
  const ClippedContainer({
    Key? key,
    required this.child,
    this.height,
    this.backgroundColor,
    this.alignment = Alignment.center,
    this.isAnimated = true,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final bool isAnimated;
  final Color? backgroundColor;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final container = Container(
      height: height,
      margin: const EdgeInsets.only(left: space2x),
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(rf(40)),
          bottomLeft: Radius.circular(rf(40)),
        ),
        color: backgroundColor ?? Theme.of(context).primaryColorLight,
      ),
      child: child,
    );

    return isAnimated
        ? SlideAnimation(
            intervalStart: 0.4,
            begin: const Offset(450, 0),
            duration: const Duration(milliseconds: 850),
            child: container,
          )
        : container;
  }
}
