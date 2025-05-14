import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  final RxBool _isPhotoPermissionGranted = RxBool(false);
  final RxBool _isNotificationPermissionGranted = RxBool(false);

  bool get isPhotoPermissionGranted => _isPhotoPermissionGranted.value;

  Future<bool> checkPhotoLibraryPermission() async {
    debugPrint('-- Checking photo permission status --');
    var status = await Permission.photos.request();
    _isPhotoPermissionGranted.value = status.isGranted || status.isLimited;
    debugPrint('-- Photo permission status: $status --');
    return _isPhotoPermissionGranted.value;
  }

  Future<bool> checkNotificationsPermission() async {
    debugPrint('-- Checking notification permission status --');
    var status = await Permission.notification.request();
    _isNotificationPermissionGranted.value =
        status.isGranted || status.isLimited;
    debugPrint('-- Notification permission status: $status --');
    return _isNotificationPermissionGranted.value;
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}
