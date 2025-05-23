import 'dart:convert';
import 'dart:io';
import 'package:breast_sono_vision/core/network/api_constants.dart';
import 'package:breast_sono_vision/data/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<ApiResponse> uploadImage(File image) async {
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
      final responseBody = await streamedResponse.stream.bytesToString();
      debugPrint(
          'Got response body: ${responseBody.substring(0, 100)}...'); // Log first 100 chars

      final Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

      // Create temporary file path for the decoded image
      final tempDir = Directory.systemTemp;
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '${tempDir.path}/segmentation_result_$timestamp.png';

      // Create SegmentationResponse which will handle base64 decoding and file creation
      final segmentationResponse = ApiResponse.fromJson(jsonResponse, filePath);

      debugPrint(
          'Segmentation stats - Total: ${segmentationResponse.totalPixels}, Benign: ${segmentationResponse.benignPixels}, Malignant: ${segmentationResponse.malignantPixels}');

      return segmentationResponse;
    } else {
      throw Exception(
          'Failed to upload image. Status code: ${streamedResponse.statusCode}');
    }
  }
}
