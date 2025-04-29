import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  final RxBool _isPhotoPermissionGranted = RxBool(false);

  bool get isPhotoPermissionGranted => _isPhotoPermissionGranted.value;

  Future<bool> checkPhotoLibraryPermission() async {
    debugPrint('-- Checking photo permission status --');
    var status = await Permission.photos.request();
    _isPhotoPermissionGranted.value = status.isGranted || status.isLimited;
    debugPrint('-- Photo permission status: $status --');
    return _isPhotoPermissionGranted.value;
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}
