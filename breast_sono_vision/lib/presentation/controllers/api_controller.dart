import 'dart:io';
import 'package:breast_sono_vision/core/util/dialogs.dart';
import 'package:breast_sono_vision/domain/usecases/upload_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final UploadImageUseCase _uploadUseCase;

  ApiController(this._uploadUseCase);

  Rx<File?> result = Rx<File?>(null);
  Rx<File?> uploadedImage = Rx<File?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> uploadImage(File image) async {
    try {
      uploadedImage.value = image;
      debugPrint('Starting API call to upload image');
      isLoading.value = true;
      // syntactic sugar: callable class --> _uploadUseCase() = _uploadUseCase.call()
      debugPrint('Waiting API response...');
      final response = await _uploadUseCase(image);
      debugPrint('Got the API response');
      result.value = response;
      debugPrint('Result value: ${result.value}');
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error message: ${errorMessage.value}');
      await showSnackbar(title: 'API Error', description: errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
