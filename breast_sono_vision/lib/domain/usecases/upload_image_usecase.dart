import 'dart:io';
import 'package:breast_sono_vision/data/models/api_response.dart';
import 'package:breast_sono_vision/data/repository/api_repository.dart';

class UploadImageUseCase {
  final ApiRepository repository;

  UploadImageUseCase(this.repository);

  Future<ApiResponse> call(File image) async {
    return await repository.uploadImage(image);
  }
}
