import 'package:breast_sono_vision/core/color_palette.dart';
import 'package:breast_sono_vision/page/result_page.dart';
import 'package:breast_sono_vision/widget/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isImageSelected = false;

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
                              ?
                              // TODO: Replace this text widget later
                              const Text('SELECTED IMAGE')
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
                          onPressed: () async {
                            setState(() {
                              _isImageSelected = true;
                            });
                          },
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
              onPressed: () async {
                // TODO: Let user image selection
              },
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
}
