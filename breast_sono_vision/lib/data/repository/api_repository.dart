import 'dart:io';

abstract class ApiRepository {
  Future<File> uploadImage(File image);
}
