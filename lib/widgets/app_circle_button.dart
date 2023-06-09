import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton(
      {super.key,
      required this.child,
      this.color,
      this.onTap,
      this.width = 60});
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        clipBehavior: Clip.hardEdge,
        shape: const CircleBorder(),
        child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child,
            )));
  }
}
