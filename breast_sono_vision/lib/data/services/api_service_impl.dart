import 'dart:io';
import 'package:breast_sono_vision/core/network/api_client.dart';
import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  final ApiClient _client;

  ApiServiceImpl(this._client);

  @override
  Future<File> uploadImage(File image) async {
    final responseFile = await _client.uploadImage(image);
    return responseFile;
  }
}
