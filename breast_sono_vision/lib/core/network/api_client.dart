import 'dart:io';
import 'package:breast_sono_vision/core/network/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<File> uploadImage(File image) async {
    final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.segmentationEndpoint}');

    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', image.path));

    final streamedResponse = await request.send();

    if (streamedResponse.statusCode == 200) {
      final bytes = await streamedResponse.stream.toBytes();

      // Save the returned PNG locally so it can be displayed
      final tempDir = Directory.systemTemp;
      final filePath = '${tempDir.path}/segmentation_result.png';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      return file;
    } else {
      throw Exception(
          'Failed to upload image. Status code: ${streamedResponse.statusCode}');
    }
  }
}
