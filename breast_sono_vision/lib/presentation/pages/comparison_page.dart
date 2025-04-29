import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: ColorPalette.secondary,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Selected Image View
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 0.7,
                    maxHeight: Get.width * 0.7,
                  ),
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Container(
                        // TODO: Delete the width and height later
                        width: Get.width,
                        height: Get.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorPalette.secondary, width: 3),
                          color: ColorPalette.secondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.5),
                          child: const Text(
                              'SELECTED IMAGE'), // TODO: Replace the text widget with the image later
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Segmented Image View
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 0.7,
                    maxHeight: Get.width * 0.7,
                  ),
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Container(
                        // TODO: Delete the width and height later
                        width: Get.width,
                        height: Get.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorPalette.secondary, width: 3),
                          color: ColorPalette.secondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.5),
                          child: const Text(
                              'SEGMENTED IMAGE'), // TODO: Replace the text widget with the image later
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * 0.35,
                  child: ElevatedButton(
                    onPressed: () async =>
                        await Get.offAll(() => const HomePage()),
                    child: const Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
