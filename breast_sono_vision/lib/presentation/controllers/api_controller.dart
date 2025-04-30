import 'dart:io';
import 'package:breast_sono_vision/domain/usecases/upload_image_usecase.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final UploadImageUseCase _uploadUseCase;

  ApiController(this._uploadUseCase);

  Rx<File?> result = Rx<File?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> uploadImage(File image) async {
    try {
      isLoading.value = true;
      // syntactic sugar: callable class --> _uploadUseCase() = _uploadUseCase.call()
      final response = await _uploadUseCase(image);
      result.value = response;
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
