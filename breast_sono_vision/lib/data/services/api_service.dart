import 'dart:io';
import 'package:breast_sono_vision/data/models/api_response.dart';

abstract class ApiService {
  Future<ApiResponse> uploadImage(File image);
}
