import 'dart:io';
import 'package:breast_sono_vision/core/util/dialogs.dart';
import 'package:breast_sono_vision/data/models/api_response.dart';
import 'package:breast_sono_vision/domain/usecases/upload_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final UploadImageUseCase _uploadUseCase;

  ApiController(this._uploadUseCase);

  Rx<File?> result = Rx<File?>(null);
  Rx<ApiResponse?> apiResponse = Rx<ApiResponse?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  // Getters for pixel statistics
  int get totalPixels => apiResponse.value?.totalPixels ?? 0;
  int get benignPixels => apiResponse.value?.benignPixels ?? 0;
  int get malignantPixels => apiResponse.value?.malignantPixels ?? 0;
  double get benignPercentage => apiResponse.value?.benignPercentage ?? 0.0;
  double get malignantPercentage =>
      apiResponse.value?.malignantPercentage ?? 0.0;
  double get normalPercentage => apiResponse.value?.normalPercentage ?? 0.0;

  Future<void> uploadImage(File image) async {
    try {
      debugPrint('Starting API call to upload image');
      isLoading.value = true;
      // syntactic sugar: callable class --> _uploadUseCase() = _uploadUseCase.call()
      debugPrint('Waiting API response...');
      final response = await _uploadUseCase(image);
      debugPrint('Got the API response');

      // Store both the segmentation response and the result file for backward compatibility
      apiResponse.value = response;
      result.value = response.resultImage;

      debugPrint('Result file: ${result.value?.path}');
      debugPrint(
          'Segmentation stats - Total: ${response.totalPixels}, Benign: ${response.benignPixels}, Malignant: ${response.malignantPixels}');
      debugPrint(
          'Percentages - Benign: ${response.benignPercentage.toStringAsFixed(2)}%, Malignant: ${response.malignantPercentage.toStringAsFixed(2)}%, Normal: ${response.normalPercentage.toStringAsFixed(2)}%');

      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error message: ${errorMessage.value}');
      await showSnackbar(
        icon: '❗️',
        title: 'api_error'.tr,
        description: errorMessage.value,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
