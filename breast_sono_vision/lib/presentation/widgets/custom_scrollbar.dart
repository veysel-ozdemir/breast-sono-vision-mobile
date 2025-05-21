import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController controller;

  const CustomScrollbar({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      thumbColor: ColorPalette.secondary,
      radius: const Radius.circular(10),
      thickness: 5,
      interactive: true,
      child: child,
    );
  }
}
