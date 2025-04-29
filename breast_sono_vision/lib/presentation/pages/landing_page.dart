import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
                const SizedBox(height: 40),
                // Circle with GIF placeholder
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      'GIF',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tagline
                      Text(
                        'Early Diagnosis,\nSaves Lives.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.tertiary,
                        ),
                      ),
                      SizedBox(height: 25),
                      // Description Text
                      Text(
                        'Breast ultrasound analysis made easy—\npowered by AI, designed to support your\nhealth journey.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                // Get Started Button
                SizedBox(
                  width: Get.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      await Get.to(() => const OnboardingPage());
                    },
                    child: const Text(
                      'Get Started',
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
}
