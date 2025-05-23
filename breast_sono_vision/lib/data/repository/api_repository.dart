import 'dart:io';
import 'package:breast_sono_vision/data/models/api_response.dart';

abstract class ApiRepository {
  Future<ApiResponse> uploadImage(File image);
}
