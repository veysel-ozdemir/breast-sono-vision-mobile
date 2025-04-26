import 'dart:io';

import 'package:breast_sono_vision/controller/permission_controller.dart';
import 'package:breast_sono_vision/core/color_palette.dart';
import 'package:breast_sono_vision/page/result_page.dart';
import 'package:breast_sono_vision/util/dialogs.dart';
import 'package:breast_sono_vision/widget/info_card.dart';
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
  final ImagePicker _imagePicker = ImagePicker();
  String? _filePath;
  bool _isImageSelected = false;

  // Pick file path from the files
  Future<String?> pickFromFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png'],
    );

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      debugPrint('Selected file path: $filePath');
      // You can now use this path to display the image or send it to your model
      return filePath;
    } else {
      debugPrint('File selection canceled.');
      return null;
    }
  }

  // Pick image from the gallery
  Future<XFile?> pickFromGallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint('Selected image path: ${image.path}');
      if (image.path.toLowerCase().endsWith('.png')) {
        return image;
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
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Breast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Sono',
                        style: TextStyle(
                          color: ColorPalette.secondary,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Vision',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Information Card
                const InfoCard(
                  icon: 'ℹ️',
                  title: 'Information',
                  description: [
                    TextSpan(
                        text:
                            'For the most accurate results, please upload your ultrasound as a '),
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
                    TextSpan(
                        text:
                            ' pixels.\nThis ensures the image is processed clearly by our AI segmentation system.'),
                  ],
                ),
                const Spacer(flex: 1),
                // Conditional Image View
                Column(
                  children: [
                    SizedBox(
                      width: Get.width * 0.8,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorPalette.secondary, width: 3),
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: _isImageSelected
                              ? Image.file(File(_filePath!),
                                  fit: BoxFit.contain)
                              : const Icon(
                                  Icons.image,
                                  color: Colors.black45,
                                  size: 75,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                  ],
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
                // TODO: Do the API call and show animated loading screen
                await Get.offAll(() => const ResultPage());
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
                        _filePath = imageSelection.path;
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
