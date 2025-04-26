import 'package:breast_sono_vision/config/global_bindings.dart';
import 'package:breast_sono_vision/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreastSonoVisionApp extends StatefulWidget {
  final Widget startingPage;
  const BreastSonoVisionApp({super.key, required this.startingPage});

  @override
  State<BreastSonoVisionApp> createState() => _BreastSonoVisionAppState();
}

class _BreastSonoVisionAppState extends State<BreastSonoVisionApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark, // TODO: Uncomment it after customizing dark theme
      themeMode: ThemeMode.system,
      home: widget.startingPage,
    );
  }
}
