import 'package:breast_sono_vision/core/color_palette.dart';
import 'package:breast_sono_vision/page/comparison_page.dart';
import 'package:breast_sono_vision/page/home_page.dart';
import 'package:breast_sono_vision/util/dialogs.dart';
import 'package:breast_sono_vision/widget/info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
                  const SizedBox(height: 20),
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
                          // TODO: Delete the width and height later
                          width: Get.width,
                          height: Get.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorPalette.secondary, width: 3),
                            color: ColorPalette.secondary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: const Text(
                                'SEGMENTED IMAGE'), // TODO: Replace the text widget with the image later
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
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
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
