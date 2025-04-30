import 'dart:io';

abstract class ApiService {
  Future<File> uploadImage(File image);
}
