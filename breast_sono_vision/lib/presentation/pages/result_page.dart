import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/controllers/api_controller.dart';
import 'package:breast_sono_vision/presentation/controllers/file_controller.dart';
import 'package:breast_sono_vision/presentation/controllers/permission_controller.dart';
import 'package:breast_sono_vision/presentation/pages/comparison_page.dart';
import 'package:breast_sono_vision/presentation/pages/home_page.dart';
import 'package:breast_sono_vision/core/util/dialogs.dart';
import 'package:breast_sono_vision/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final ApiController apiController = Get.find();
  final FileController fileController = Get.find();
  final PermissionController permissionController = Get.find();
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
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _pageVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  // Information Card
                  const InfoCard(
                    icon: '🔎',
                    title: 'Understanding Your Result',
                    description: [
                      TextSpan(
                          text:
                              'This image shows the segmented regions detected by our AI system:\n🟥 '),
                      TextSpan(
                        text: 'Red',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' areas may indicate potentially '),
                      TextSpan(
                        text: 'malignant',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' (cancerous) tissue.\n🟩 '),
                      TextSpan(
                        text: 'Green',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' areas may suggest '),
                      TextSpan(
                        text: 'benign',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' (non-cancerous) findings.\n✅ If '),
                      TextSpan(
                        text: 'no colored regions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text:
                              ' appear, no notable tissue was detected — which is often a '),
                      TextSpan(
                        text: 'good sign',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
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
                                color: ColorPalette.secondary, width: 3),
                            color: ColorPalette.secondary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.5),
                            child: Image.file(
                              apiController.result.value!,
                              scale: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  SizedBox(
                    width: Get.width * 0.75,
                    child: const Text(
                      'Curious to compare? View your original next to the result — or go home to try another scan.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  IntrinsicWidth(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () async {
                              await Get.to(() => const ComparisonPage());
                            },
                            child: const Text(
                              'Compare',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await Get.offAll(() => const HomePage());
                            },
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
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
          color: ColorPalette.border,
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
                child: const Text(
                  'Share the Image',
                  style: TextStyle(
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
                child: const Text(
                  'Save to Gallery',
                  style: TextStyle(
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
