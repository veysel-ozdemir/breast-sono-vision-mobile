import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Print each key-value pairs of Shared Prefs
void printKeyValueOfSharedPrefs(SharedPreferences prefs) {
  for (var k in prefs.getKeys()) {
    debugPrint('$k: ${prefs.get(k)}');
  }
}
