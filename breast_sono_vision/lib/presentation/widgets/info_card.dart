import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final List<InlineSpan>? description;
  final Widget? bottomWidgets;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.bottomWidgets, // Optional named parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.secondary, width: 3),
        color: ColorPalette.background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: ColorPalette.onBackground,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: AppTheme.manropeFontFamily,
              ),
              children: [
                TextSpan(text: icon),
                const WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(text: title)
              ],
            ),
          ),
          const Divider(color: ColorPalette.onBackground, thickness: 2),
          // Content
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: TextStyle(
                color: ColorPalette.onBackground,
                fontSize: 14,
                fontFamily: AppTheme.manropeFontFamily,
              ),
              children: description,
            ),
          ),
          // Additional Widgets
          bottomWidgets ?? const SizedBox(),
        ],
      ),
    );
  }
}
