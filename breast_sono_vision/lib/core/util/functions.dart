import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

// Print each key-value pairs of Shared Prefs
void printKeyValueOfSharedPrefs(SharedPreferences prefs) {
  for (var k in prefs.getKeys()) {
    debugPrint('$k: ${prefs.get(k)}');
  }
}

// Convert JPG (JPEG) image files to PNG
Future<String?> convertJpgToPng(String inputPath) async {
  // Read the image file
  final File inputFile = File(inputPath);
  final Uint8List inputBytes = await inputFile.readAsBytes();

  // Decode the image
  final ui.Codec codec = await ui.instantiateImageCodec(inputBytes);
  final ui.FrameInfo frameInfo = await codec.getNextFrame();
  final ui.Image image = frameInfo.image;

  // Convert the image to PNG
  final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
  if (byteData != null) {
    // Get the converted PNG bytes
    final Uint8List pngBytes = byteData.buffer.asUint8List();

    // Use the system temporary directory path
    String tempDirPath = Directory.systemTemp.path;
    debugPrint('Temp directory path: $tempDirPath');

    // Get the image file name from input path
    String fileNameWithoutExtension = path.basenameWithoutExtension(inputPath);

    // Create the converted file name
    String convertedFileName = '${fileNameWithoutExtension}_converted.png';

    // Combine the temporary directory path with the new file name
    String convertedFilePath = path.join(tempDirPath, convertedFileName);
    debugPrint('Converted file path: $convertedFilePath');

    // Save the PNG image
    final File outputFile = File(convertedFilePath);
    await outputFile.writeAsBytes(pngBytes);
    debugPrint('PNG conversion completed.');
    return convertedFilePath;
  } else {
    debugPrint('PNG conversion failed');
    return null;
  }
}
