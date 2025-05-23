import 'dart:io';
import 'package:breast_sono_vision/data/models/api_response.dart';
import 'package:breast_sono_vision/data/services/api_service.dart';
import 'api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiService _apiService;

  ApiRepositoryImpl(this._apiService);

  @override
  Future<ApiResponse> uploadImage(File image) async {
    return await _apiService.uploadImage(image);
  }
}
