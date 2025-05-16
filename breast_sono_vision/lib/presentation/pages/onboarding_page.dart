import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/presentation/pages/home_page.dart';
import 'package:breast_sono_vision/presentation/widgets/slanted_image_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  late SharedPreferences prefs;
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: 'onboarding_title_1'.tr,
      description: 'onboarding_description_1'.tr,
      illustration: Lottie.asset('assets/animation/medical-scan.json'),
    ),
    OnboardingContent(
      title: 'onboarding_title_2'.tr,
      description: 'onboarding_description_2'.tr,
      illustration: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.375,
                  maxHeight: Get.width * 0.375,
                ),
                child: IntrinsicWidth(
                  child: IntrinsicHeight(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorPalette.secondary, width: 3),
                        color: ColorPalette.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.5),
                        child: Image.asset(
                          'assets/image/breast_ultrasound_871.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'your_ultrasound'.tr,
                style: TextStyle(
                  color: ColorPalette.secondary,
                  fontSize: 24,
                  fontFamily: AppTheme.bebasNeueFontFamily,
                ),
              ),
            ],
          ),
          Expanded(
            child: Lottie.asset('assets/animation/arrows.json'),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.375,
                  maxHeight: Get.width * 0.375,
                ),
                child: IntrinsicWidth(
                  child: IntrinsicHeight(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorPalette.secondary, width: 3),
                        color: ColorPalette.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.5),
                        child: Image.asset(
                          'assets/image/segmentation_result_871.PNG',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'our_result'.tr,
                style: TextStyle(
                  color: ColorPalette.secondary,
                  fontSize: 24,
                  fontFamily: AppTheme.bebasNeueFontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    OnboardingContent(
      title: 'onboarding_title_3'.tr,
      description: 'onboarding_description_3'.tr,
      illustration: const SlantedImageCards(
        assetPaths: [
          'assets/image/segmentation_result_836.PNG',
          'assets/image/segmentation_result_929.PNG',
          'assets/image/segmentation_result_862.PNG',
        ],
      ),
    ),
  ];

  Future<void> _loadSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _saveSharedPrefs() async {
    await prefs.setBool('isOnboardingPassed', true);
  }

  @override
  void initState() {
    _loadSharedPrefs();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToNextPage() async {
    // If current page isn't the last
    if (_currentPage < _contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // If current page is the actually the last page
      await _saveSharedPrefs();
      await Get.offAll(() => const HomePage());
    }
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
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: _contents.length,
                    itemBuilder: (context, index) {
                      return _buildPage(_contents[index]);
                    },
                  ),
                ),
                // Pagination Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _contents.length,
                    (index) => _buildDot(index),
                  ),
                ),
                const SizedBox(height: 50),
                // Continue Button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _navigateToNextPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          // If current page isn't the last
                          _currentPage < _contents.length - 1
                              ? 'continue'.tr
                              : 'get_started'.tr,
                          style: const TextStyle(
                            color: ColorPalette.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorPalette.secondary,
                          size: 40,
                        ),
                      ],
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

  Widget _buildPage(OnboardingContent content) {
    return Column(
      children: [
        const Spacer(flex: 1),
        SizedBox(
          height: Get.width * 0.55,
          child: content.illustration,
        ),
        const Spacer(flex: 2),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tagline
              Text(
                content.title,
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
                content.description,
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
      ],
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: _currentPage == index ? 25 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? ColorPalette.secondary
            : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
