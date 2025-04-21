import 'package:flutter/material.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to the Onboarding page!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
