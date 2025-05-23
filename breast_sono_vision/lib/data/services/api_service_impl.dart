import 'dart:io';
import 'package:breast_sono_vision/core/network/api_client.dart';
import 'package:breast_sono_vision/data/models/api_response.dart';
import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  final ApiClient _client;

  ApiServiceImpl(this._client);

  @override
  Future<ApiResponse> uploadImage(File image) async {
    final response = await _client.uploadImage(image);
    return response;
  }
}
