import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_scrollbar.dart';

class ScrollableInfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final List<InlineSpan>? description;
  final Widget? bottomWidgets;
  final double height;

  const ScrollableInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.height,
    this.bottomWidgets,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.onBackground, width: 3),
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
          // Scrollable Content
          Expanded(
            child: CustomScrollbar(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      if (bottomWidgets != null) ...[
                        const SizedBox(height: 10),
                        bottomWidgets!,
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
