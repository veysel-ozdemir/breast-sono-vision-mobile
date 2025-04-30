import 'dart:io';

import 'package:breast_sono_vision/presentation/controllers/api_controller.dart';
import 'package:breast_sono_vision/presentation/controllers/permission_controller.dart';
import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/pages/result_page.dart';
import 'package:breast_sono_vision/core/util/dialogs.dart';
import 'package:breast_sono_vision/core/util/functions.dart';
import 'package:breast_sono_vision/presentation/widgets/info_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PermissionController permissionController = Get.find();
  final ApiController apiController = Get.find();
  final ImagePicker _imagePicker = ImagePicker();
  String? _filePath;
  bool _isImageSelected = false;

  // Pick file path from the files
  Future<String?> pickFromFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      debugPrint('Selected file path: $filePath');
      if (filePath.toLowerCase().endsWith('.png')) {
        // You can now use this path to display the image or send it to your model
        return filePath;
      } else if (filePath.toLowerCase().endsWith('.jpg') ||
          filePath.toLowerCase().endsWith('.jpeg')) {
        debugPrint('Image file is being formatted to PNG...');
        // Convert JPG image file to PNG
        final convertedImagePath = await convertJpgToPng(filePath);
        if (convertedImagePath != null) {
          return convertedImagePath;
        } else {
          await showSnackbar(
            title: 'Image Conversion Failed',
            description: 'Error occurred while converting your JPG file',
          );
          return null;
        }
      } else {
        return null;
      }
    } else {
      debugPrint('File selection canceled.');
      return null;
    }
  }

  // Pick image from the gallery
  Future<String?> pickFromGallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint('Selected image path: ${image.path}');
      if (image.path.toLowerCase().endsWith('.png')) {
        return image.path;
      } else if (image.path.toLowerCase().endsWith('.jpg') ||
          image.path.toLowerCase().endsWith('.jpeg')) {
        debugPrint('Image is being formatted to PNG...');
        // Convert JPG image file to PNG
        final convertedImagePath = await convertJpgToPng(image.path);
        if (convertedImagePath != null) {
          return convertedImagePath;
        } else {
          await showSnackbar(
            title: 'Image Conversion Failed',
            description: 'Error occurred while converting your JPG file',
          );
          return null;
        }
      } else {
        debugPrint('Unsupported image format selected.');
        // Show format error
        await showSnackbar(
          title: 'Unsupported Format',
          description: 'Please select a PNG image',
        );
        return null;
      }
    } else {
      debugPrint('Image selection canceled.');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    // Remove the native splash screen
    FlutterNativeSplash.remove();
  }

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
                RichText(
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
                const Spacer(flex: 1),
                // Information Card
                const InfoCard(
                  icon: 'ℹ️',
                  title: 'Information',
                  description: [
                    TextSpan(
                        text:
                            'For the most accurate results, upload your ultrasound as a '),
                    TextSpan(
                      text: 'PNG',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' file with a resolution around '),
                    TextSpan(
                      text: '600×600',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' pixels. \n\n'),
                    TextSpan(
                      text: 'JPG',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'JPEG',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text:
                            ' files are also accepted but will be converted to PNG to maintain quality for AI analysis.'),
                  ],
                ),
                const Spacer(flex: 1),
                // Conditional Image View
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 0.8,
                    maxHeight: Get.width * 0.8,
                  ),
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Container(
                        width: _isImageSelected ? null : Get.width,
                        height: _isImageSelected ? null : Get.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorPalette.secondary, width: 3),
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: _isImageSelected
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12.5),
                                child: Image.file(
                                  File(_filePath!),
                                  scale: 0.8,
                                ),
                              )
                            : const Icon(
                                Icons.image,
                                color: Colors.black45,
                                size: 75,
                              ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                SizedBox(
                  width: Get.width * 0.75,
                  child: Text(
                    _isImageSelected
                        ? 'Ready to see the result? Let AI analyze your image — or tap below to choose a different one.'
                        : "Let's select your breast ultrasound.\nEnsure that all permissions are granted for the app to work properly.",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                // Conditional Button Layout
                _isImageSelected
                    ? _selectedImageButtons()
                    : SizedBox(
                        width: Get.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await _showUploadSourceSelection(),
                          child: const Text(
                            'Upload Image',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
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

  Widget _selectedImageButtons() {
    return IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () async => await _showUploadSourceSelection(),
              child: const Text(
                'Upload Again',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                if (_filePath != null) {
                  apiController.uploadImage(File(_filePath!));
                  // Show loading indicator while the API call is in progress
                  await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Obx(() {
                        if (apiController.isLoading.value) {
                          return Container(
                            width: Get.width,
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    width: 75,
                                    height: 75,
                                    child: CircularProgressIndicator(
                                      color: ColorPalette.background,
                                      strokeWidth: 5,
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Analyzing...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: ColorPalette.background,
                                        fontFamily: AppTheme.manropeFontFamily,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          // Delay the state update to avoid calling setState during build
                          Future.delayed(Duration.zero, () {
                            if (context.mounted) Navigator.of(context).pop();
                            // Navigate to ResultPage if result is not null
                            if (apiController.result.value != null) {
                              Get.offAll(() => const ResultPage());
                            }
                          });
                          return const SizedBox.shrink();
                        }
                      });
                    },
                  );
                } else {
                  // Handle case where no file is selected
                  await showSnackbar(
                    title: 'No Image Selected',
                    description: 'Please select an image to upload.',
                  );
                }
              },
              child: const Text(
                'Analyze',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showUploadSourceSelection() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10),
        child: _uploadSourceOptions(context: context),
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

  Widget _uploadSourceOptions({required BuildContext context}) {
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
                  final fileSelection = await pickFromFiles();
                  if (fileSelection != null) {
                    setState(() {
                      _filePath = fileSelection;
                      _isImageSelected = true;
                    });
                    // Dismiss the modal bottom sheet
                    if (context.mounted) Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Select From Files',
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
                  bool permissionsGranted =
                      await permissionController.checkPhotoLibraryPermission();
                  if (permissionsGranted) {
                    final imageSelection = await pickFromGallery();
                    if (imageSelection != null) {
                      setState(() {
                        _filePath = imageSelection;
                        _isImageSelected = true;
                      });
                      // Dismiss the modal bottom sheet
                      if (context.mounted) Navigator.pop(context);
                    }
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
                  'Select From Gallery',
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
