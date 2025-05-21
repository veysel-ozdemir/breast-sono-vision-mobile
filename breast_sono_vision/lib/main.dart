import 'package:breast_sono_vision/app/app.dart';
import 'package:breast_sono_vision/data/services/notification_service.dart';
import 'package:breast_sono_vision/presentation/pages/home_page.dart';
import 'package:breast_sono_vision/presentation/pages/landing_page.dart';
import 'package:breast_sono_vision/core/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Initialize the app
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize the native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Load the .env file
  await dotenv.load(fileName: ".env");

  // Initialize notifications
  await NotificationService().initNotification();

  // Load shared preferences data
  final prefs = await SharedPreferences.getInstance();

  // TODO: These lines are for testing, delete it later
  // await prefs.remove('isOnboardingPassed');
  // await prefs.clear();
  // NotificationService().cancelAllNotifications();

  debugPrint('\nShared Prefs Key-Value Pairs:');
  printKeyValueOfSharedPrefs(prefs);
  debugPrint('------------------------\n');

  // Set the default locale for the app
  final Locale locale;
  String? currentLocale = prefs.getString('locale');
  if (currentLocale == null) {
    // If the locale is not set, use the device's locale
    locale = Get.deviceLocale ?? const Locale('en');
    // Save the device's locale to shared preferences
    await prefs.setString('locale', locale.languageCode);
    debugPrint('Locale not set. Using device locale: $locale');
  } else {
    // If the locale is set, use it
    locale = Locale(currentLocale);
    debugPrint('Locale set in shared preferences: $currentLocale');
  }

  final Widget startingPage;

  // Check whether the user passed the onboarding and set the starting page accordingly
  final bool? isOnboardingPassed = prefs.getBool('isOnboardingPassed');
  if (isOnboardingPassed == null || isOnboardingPassed == false) {
    startingPage = const LandingPage();
  } else {
    startingPage = const HomePage();
  }

  // Lock the app orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    // Run the app
    runApp(
      BreastSonoVisionApp(
        startingPage: startingPage,
        locale: locale,
      ),
    );
  });
}
