import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
                const Spacer(flex: 1),
                SizedBox(
                  child: Lottie.asset(
                      'assets/animation/breast-cancer-ribbon.json'),
                ),
                const Spacer(flex: 1),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tagline
                      Text(
                        'landing_page_tagline'.tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.tertiary,
                          fontFamily: AppTheme.bebasNeueFontFamily,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // Description Text
                      Text(
                        'landing_page_description'.tr,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                // Get Started Button
                SizedBox(
                  width: Get.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      await Get.to(() => const OnboardingPage());
                    },
                    child: Text(
                      'get_started'.tr,
                      style: const TextStyle(
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
