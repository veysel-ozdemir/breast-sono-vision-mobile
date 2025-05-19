import 'package:get/get.dart';

// ! Use as getter to let the translations be applied instantly
Map<String, Map<String, String>> get languages => {
      'de': {'flag': '🇩🇪', 'name': 'german'.tr},
      'en': {'flag': '🇺🇸', 'name': 'english'.tr},
      'fr': {'flag': '🇫🇷', 'name': 'french'.tr},
      'tr': {'flag': '🇹🇷', 'name': 'turkish'.tr},
    };
