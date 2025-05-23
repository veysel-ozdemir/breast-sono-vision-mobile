import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/controllers/api_controller.dart';
import 'package:breast_sono_vision/presentation/controllers/file_controller.dart';
import 'package:breast_sono_vision/presentation/controllers/permission_controller.dart';
import 'package:breast_sono_vision/presentation/pages/comparison_page.dart';
import 'package:breast_sono_vision/presentation/pages/home_page.dart';
import 'package:breast_sono_vision/core/util/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_theme.dart';
import '../widgets/custom_scrollbar.dart';
import '../widgets/scrollable_info_card.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final ApiController apiController = Get.find();
  final FileController fileController = Get.find();
  final PermissionController permissionController = Get.find();
  final ScrollController scrollController = ScrollController();
  bool _pageVisible = false;

  @override
  void initState() {
    super.initState();
    // Show the disclaimer dialog after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDisclaimerDialog(
        context: context,
        onPressed: () {
          setState(() {
            _pageVisible = true;
          });
          Get.back();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Breast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTheme.manropeFontFamily,
                ),
              ),
              TextSpan(
                text: 'Sono',
                style: TextStyle(
                  color: ColorPalette.secondary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTheme.manropeFontFamily,
                ),
              ),
              TextSpan(
                text: 'Vision',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTheme.manropeFontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _pageVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: Get.width,
              child: CustomScrollbar(
                controller: scrollController,
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    controller: scrollController,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(flex: 1),
                              // Image View
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: Get.width * 0.8,
                                  maxHeight: Get.width * 0.8,
                                ),
                                child: IntrinsicWidth(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorPalette.secondary,
                                            width: 3),
                                        color: ColorPalette.secondary,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.5),
                                        child: Image.file(
                                          apiController.result.value!,
                                          scale: 0.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(flex: 1),
                              // Information Cards - Horizontal ListView
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.85,
                                      child: ScrollableInfoCard(
                                        icon: '🔎',
                                        title: 'result_info_card_title'.tr,
                                        height: Get.height * 0.2,
                                        description: [
                                          TextSpan(
                                              text:
                                                  'result_info_card_text_1'.tr),
                                          TextSpan(
                                            text: 'red'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                              text:
                                                  'result_info_card_text_2'.tr),
                                          TextSpan(
                                            text: 'malignant'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                              text:
                                                  'result_info_card_text_3'.tr),
                                          TextSpan(
                                            text: 'green'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                              text:
                                                  'result_info_card_text_4'.tr),
                                          TextSpan(
                                            text: 'benign'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                              text:
                                                  'result_info_card_text_5'.tr),
                                          TextSpan(
                                            text: 'result_info_card_text_6'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                              text:
                                                  'result_info_card_text_7'.tr),
                                          TextSpan(
                                            text: 'result_info_card_text_8'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const TextSpan(text: '.'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: Get.width * 0.85,
                                      child: ScrollableInfoCard(
                                        icon: '📊',
                                        title:
                                            'pixel_analysis_info_card_title'.tr,
                                        height: Get.height * 0.2,
                                        description: [
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_1'
                                                    .tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                '${apiController.benignPixels}${'pixels'.tr}(${apiController.benignPercentage.toStringAsFixed(1)}%)',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          ),
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_2'
                                                    .tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                '${apiController.malignantPixels}${'pixels'.tr}(${apiController.malignantPercentage.toStringAsFixed(1)}%)',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_3'
                                                    .tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                '${apiController.normalPercentage.toStringAsFixed(1)}%',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_4'
                                                    .tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                '${apiController.totalPixels}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_5'
                                                    .tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_6'
                                                    .tr,
                                          ),
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_7'
                                                    .tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                'pixel_analysis_info_card_text_8'
                                                    .tr,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(flex: 1),
                              // Download & Share Button
                              SizedBox(
                                child: OutlinedButton(
                                  onPressed: () async {
                                    await _showSaveSourceSelection();
                                  },
                                  child: const Icon(
                                    Icons.download,
                                    color: ColorPalette.secondary,
                                    size: 32,
                                  ),
                                ),
                              ),
                              const Spacer(flex: 1),
                              // Description Text
                              SizedBox(
                                width: Get.width * 0.75,
                                child: Text(
                                  'result_page_description'.tr,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(flex: 2),
                              // Compare & Home Buttons
                              IntrinsicWidth(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          await Get.to(
                                              () => const ComparisonPage());
                                        },
                                        child: Text(
                                          'compare'.tr,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await Get.offAll(
                                              () => const HomePage());
                                        },
                                        child: const Text(
                                          'Home',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(flex: 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showSaveSourceSelection() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10),
        child: _saveSourceOptions(context: context),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: ColorPalette.secondary,
          width: 3,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      backgroundColor: ColorPalette.background,
      isDismissible: true,
    );
  }

  Widget _saveSourceOptions({required BuildContext context}) {
    return SafeArea(
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(10),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: ColorPalette.secondary,
                  side: const BorderSide(
                    color: ColorPalette.secondary,
                    width: 2,
                  ),
                ),
                onPressed: () async {
                  final status = await fileController.share(
                    imagePath: apiController.result.value!.path,
                  );
                  if (status) {
                    // Dismiss the modal bottom sheet
                    if (context.mounted) Navigator.pop(context);
                  }
                },
                child: Text(
                  'share_the_image'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: ColorPalette.secondary,
                  side: const BorderSide(
                    color: ColorPalette.secondary,
                    width: 2,
                  ),
                ),
                onPressed: () async {
                  bool permissionGranted =
                      await permissionController.checkPhotoLibraryPermission();
                  if (permissionGranted) {
                    await fileController
                        .saveToGallery(
                      imagePath: apiController.result.value!.path,
                    )
                        .then((_) {
                      // Dismiss the modal bottom sheet
                      if (context.mounted) Navigator.pop(context);
                    });
                  } else {
                    if (context.mounted) {
                      await showPermissionDialog(
                        context: context,
                        onPressed: () async =>
                            await permissionController.openSettings(),
                      ).then((_) {
                        // Dismiss the modal bottom sheet
                        if (context.mounted) Navigator.pop(context);
                      });
                    }
                  }
                },
                child: Text(
                  'save_to_gallery'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
