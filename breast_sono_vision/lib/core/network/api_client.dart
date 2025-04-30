import 'dart:io';
import 'package:breast_sono_vision/core/network/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<File> uploadImage(File image) async {
    final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.segmentationEndpoint}');
    debugPrint('Parsed the URI: $uri');

    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', image.path));
    debugPrint('Created the request: $request');

    debugPrint('Sending the request...');
    final streamedResponse = await request.send();
    debugPrint(
        'Got the streamed response with status code: ${streamedResponse.statusCode}');

    if (streamedResponse.statusCode == 200) {
      final bytes = await streamedResponse.stream.toBytes();

      // Save the returned PNG locally so it can be displayed
      final tempDir = Directory.systemTemp;
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '${tempDir.path}/segmentation_result_$timestamp.png';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      return file;
    } else {
      throw Exception(
          'Failed to upload image. Status code: ${streamedResponse.statusCode}');
    }
  }
}
