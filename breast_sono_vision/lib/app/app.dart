import 'package:breast_sono_vision/config/global_bindings.dart';
import 'package:breast_sono_vision/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/util/messages.dart';

class BreastSonoVisionApp extends StatefulWidget {
  final Widget startingPage;
  final Locale locale;
  const BreastSonoVisionApp({
    super.key,
    required this.startingPage,
    required this.locale,
  });

  @override
  State<BreastSonoVisionApp> createState() => _BreastSonoVisionAppState();
}

class _BreastSonoVisionAppState extends State<BreastSonoVisionApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      // your translations
      translations: Messages(),
      // translations will be displayed in that locale
      locale: widget.locale,
      // specify the fallback locale in case an invalid locale is selected.
      fallbackLocale: const Locale('en'),
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark, // TODO: Uncomment it after customizing dark theme
      themeMode: ThemeMode.system,
      home: widget.startingPage,
    );
  }
}
