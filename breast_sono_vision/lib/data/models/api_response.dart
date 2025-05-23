import 'dart:convert';
import 'dart:io';

class ApiResponse {
  final File resultImage;
  final int totalPixels;
  final int benignPixels;
  final int malignantPixels;

  ApiResponse({
    required this.resultImage,
    required this.totalPixels,
    required this.benignPixels,
    required this.malignantPixels,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, String tempFilePath) {
    // Decode base64 string to bytes
    final base64String = json['result'] as String;
    final bytes = base64Decode(base64String);

    // Create file from bytes
    final file = File(tempFilePath);
    file.writeAsBytesSync(bytes);

    return ApiResponse(
      resultImage: file,
      totalPixels: json['total_pixels'] as int,
      benignPixels: json['benign_pixels'] as int,
      malignantPixels: json['malignant_pixels'] as int,
    );
  }

  double get benignPercentage =>
      totalPixels > 0 ? (benignPixels / totalPixels) * 100 : 0.0;
  double get malignantPercentage =>
      totalPixels > 0 ? (malignantPixels / totalPixels) * 100 : 0.0;
  double get normalPercentage => totalPixels > 0
      ? ((totalPixels - benignPixels - malignantPixels) / totalPixels) * 100
      : 0.0;
}
