import 'package:breast_sono_vision/core/color_palette.dart';
import 'package:breast_sono_vision/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      title: 'Your Body Speaks,\nWe Help You Understand.',
      description:
          "We interpret your ultrasound image to give\nyou clearer insight into what's going on inside.",
      gif: 'GIF 1',
    ),
    OnboardingContent(
      title: 'Upload, Analyze, and\nVisualize.',
      description:
          "Upload your image, and receive AI-segmented\nresults that highlight potential concerns in seconds.",
      gif: 'GIF 2',
    ),
    OnboardingContent(
      title: 'Clear Results,\nConfident Next Steps.',
      description:
          "Visual segmentation helps you better\nunderstand your scan and what it may reveal.",
      gif: 'GIF 3',
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
                              ? 'Continue'
                              : 'Get Started',
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
        const SizedBox(height: 40),
        // Circle with GIF placeholder
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              content.gif,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tagline
              Text(
                content.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.tertiary,
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
        const Spacer(flex: 1),
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

class OnboardingContent {
  final String title;
  final String description;
  // TODO: Change the type to widget
  final String gif;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.gif,
  });
}
