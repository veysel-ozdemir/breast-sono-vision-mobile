import 'package:breast_sono_vision/data/services/notification_service.dart';
import 'package:breast_sono_vision/presentation/controllers/api_controller.dart';
import 'package:breast_sono_vision/presentation/controllers/file_controller.dart';
import 'package:breast_sono_vision/presentation/controllers/permission_controller.dart';
import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/pages/result_page.dart';
import 'package:breast_sono_vision/core/util/dialogs.dart';
import 'package:breast_sono_vision/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PermissionController permissionController = Get.find();
  final FileController fileController = Get.find();
  final ApiController apiController = Get.find();
  final NotificationService notificationService = NotificationService();
  final ScrollController scrollController = ScrollController();
  late final SharedPreferences prefs;
  String? _currentLocale;
  bool _isImageSelected = false;

  _loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLocale = prefs.getString('locale');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
    // Remove the native splash screen
    FlutterNativeSplash.remove();
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
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: ColorPalette.background,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Lottie.asset('assets/animation/breast-cancer-ribbon.json'),
              ListTile(
                leading: const Icon(
                  Icons.schedule_rounded,
                  color: ColorPalette.border,
                  size: 32,
                ),
                onTap: () async {
                  final isGranted =
                      await permissionController.checkNotificationsPermission();
                  if (!isGranted) {
                    if (context.mounted) {
                      await showPermissionDialog(
                        context: context,
                        onPressed: () async =>
                            await permissionController.openSettings(),
                      );
                    }
                  } else {
                    if (context.mounted) {
                      await showScheduledNotificationDialog(context: context);
                    }
                  }
                },
                title: Text(
                  'schedule_daily_reminder'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppTheme.manropeFontFamily,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.border,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.language_rounded,
                  color: ColorPalette.border,
                  size: 32,
                ),
                onTap: () async {
                  await showLanguageSelectorDialog(
                    context: context,
                    currentLocale: _currentLocale!,
                  );
                },
                title: Text(
                  'language'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppTheme.manropeFontFamily,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.border,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: Get.width,
            child: RawScrollbar(
              controller: scrollController,
              thickness: 5,
              thumbColor: ColorPalette.secondary,
              radius: const Radius.circular(10),
              interactive: true,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      // Information Card
                      InfoCard(
                        icon: 'ℹ️',
                        title: 'home_info_card_title'.tr,
                        description: [
                          TextSpan(text: 'home_info_card_text_1'.tr),
                          const TextSpan(
                            text: 'PNG',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'home_info_card_text_2'.tr),
                          const TextSpan(
                            text: '600×600',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'home_info_card_text_3'.tr),
                          const TextSpan(
                            text: 'JPG',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'home_info_card_text_4'.tr),
                          const TextSpan(
                            text: 'JPEG',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'home_info_card_text_5'.tr,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                                color: _isImageSelected
                                    ? ColorPalette.secondary
                                    : Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: _isImageSelected
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(12.5),
                                      child: Image.file(
                                        fileController.image.value!,
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
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * 0.75,
                        child: Text(
                          _isImageSelected
                              ? 'home_page_description_1'.tr
                              : 'home_page_description_2'.tr,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Conditional Button Layout
                      _isImageSelected
                          ? _selectedImageButtons()
                          : SizedBox(
                              width: Get.width * 0.5,
                              child: ElevatedButton(
                                onPressed: () async =>
                                    await _showUploadSourceSelection(),
                                child: Text(
                                  'upload_image'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
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
              child: Text(
                'upload_again'.tr,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                if (_isImageSelected) {
                  apiController.uploadImage(fileController.image.value!);
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
                                      text: 'analyzing'.tr,
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
                    icon: '❗️',
                    title: 'no_image_selected'.tr,
                    description: 'no_image_selected_description'.tr,
                  );
                }
              },
              child: Text(
                'analyze'.tr,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  // Create a separate dialog context reference
                  BuildContext? dialogContext;

                  // Setup a listener for conversion state changes
                  final conversionListener =
                      fileController.isConverting.listen((isConverting) {
                    debugPrint(
                        'Files: Conversion state changed to: $isConverting');

                    if (isConverting) {
                      // Show dialog when conversion starts
                      if (context.mounted && dialogContext == null) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext ctx) {
                            dialogContext = ctx;
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
                                        text: 'converting_jpg_file'.tr,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: ColorPalette.background,
                                          fontFamily:
                                              AppTheme.manropeFontFamily,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } else if (dialogContext != null) {
                      // Close dialog when conversion completes
                      Navigator.of(dialogContext!).pop();
                      dialogContext = null;
                    }
                  });

                  try {
                    // Pick the file
                    final isFileSelected = await fileController.pickFromFiles();

                    if (isFileSelected != null && isFileSelected == true) {
                      setState(() {
                        _isImageSelected = true;
                      });
                      // Dismiss the modal bottom sheet
                      if (context.mounted) Navigator.pop(context);
                    }
                  } finally {
                    // Always cancel the listener when done
                    conversionListener.cancel();
                  }
                },
                child: Text(
                  'select_from_files'.tr,
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
                  bool permissionsGranted =
                      await permissionController.checkPhotoLibraryPermission();
                  if (permissionsGranted) {
                    // Create a separate dialog context reference
                    BuildContext? dialogContext;

                    // Setup a listener for conversion state changes
                    final conversionListener =
                        fileController.isConverting.listen((isConverting) {
                      debugPrint(
                          'Gallery: Conversion state changed to: $isConverting');

                      if (isConverting) {
                        // Show dialog when conversion starts
                        if (context.mounted && dialogContext == null) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              dialogContext = ctx;
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
                                          text: 'converting_jpg_file'.tr,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: ColorPalette.background,
                                            fontFamily:
                                                AppTheme.manropeFontFamily,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } else if (dialogContext != null) {
                        // Close dialog when conversion completes
                        Navigator.of(dialogContext!).pop();
                        dialogContext = null;
                      }
                    });

                    try {
                      // Pick from gallery
                      final isImageSelected =
                          await fileController.pickFromGallery();

                      if (isImageSelected != null && isImageSelected == true) {
                        setState(() {
                          _isImageSelected = true;
                        });
                        // Dismiss the modal bottom sheet
                        if (context.mounted) Navigator.pop(context);
                      }
                    } finally {
                      // Always cancel the listener when done
                      conversionListener.cancel();
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
                child: Text(
                  'select_from_gallery'.tr,
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
