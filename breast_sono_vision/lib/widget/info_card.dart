import 'package:breast_sono_vision/core/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final List<InlineSpan>? description;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.border, width: 3),
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
              style: const TextStyle(
                color: ColorPalette.onBackground,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: icon,
                ),
                const WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                  text: title,
                )
              ],
            ),
          ),
          // Content
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: const TextStyle(
                color: ColorPalette.onBackground,
                fontSize: 14,
              ),
              children: description,
            ),
          ),
        ],
      ),
    );
  }
}
