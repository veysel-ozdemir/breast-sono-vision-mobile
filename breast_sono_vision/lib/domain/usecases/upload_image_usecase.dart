import 'dart:io';
import 'package:breast_sono_vision/data/repository/api_repository.dart';

class UploadImageUseCase {
  final ApiRepository repository;

  UploadImageUseCase(this.repository);

  Future<File> call(File image) {
    return repository.uploadImage(image);
  }
}
