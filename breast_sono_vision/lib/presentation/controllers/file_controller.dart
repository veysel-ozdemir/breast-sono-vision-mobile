import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../../core/util/dialogs.dart';
import '../../core/util/functions.dart';

class FileController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();

  Rx<File?> image = Rx<File?>(null);
  RxBool isConverting = false.obs;
  RxString errorMessage = ''.obs;

  // Pick file path from the files
  Future<bool?> pickFromFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
      );

      if (result != null && result.files.single.path != null) {
        final filePath = result.files.single.path!;
        debugPrint('Selected file path: $filePath');
        if (filePath.toLowerCase().endsWith('.png')) {
          // You can now use this path to display the image or send it to your model
          image.value = File(filePath);
          return true;
        } else if (filePath.toLowerCase().endsWith('.jpg') ||
            filePath.toLowerCase().endsWith('.jpeg')) {
          debugPrint('Image file is being formatted to PNG...');
          isConverting.value = true;
          // Convert JPG image file to PNG
          final convertedImagePath = await convertJpgToPng(filePath);
          if (convertedImagePath != null) {
            image.value = File(convertedImagePath);
            return true;
          } else {
            await showSnackbar(
              icon: '❗️',
              title: 'Image Conversion Failed',
              description: 'Error occurred while converting your JPG file',
            );
            return null;
          }
        } else {
          return null;
        }
      } else {
        debugPrint('File selection canceled.');
        return null;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error message: ${errorMessage.value}');
      await showSnackbar(
        icon: '❗️',
        title: 'File Selection Error',
        description: errorMessage.value,
      );
    } finally {
      isConverting.value = false;
    }
    return null;
  }

  // Pick image from the gallery
  Future<bool?> pickFromGallery() async {
    try {
      final XFile? selectedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        debugPrint('Selected image path: ${selectedImage.path}');
        if (selectedImage.path.toLowerCase().endsWith('.png')) {
          image.value = File(selectedImage.path);
          return true;
        } else if (selectedImage.path.toLowerCase().endsWith('.jpg') ||
            selectedImage.path.toLowerCase().endsWith('.jpeg')) {
          // Convert JPG image file to PNG
          debugPrint('Image is being formatted to PNG...');
          isConverting.value = true;
          final convertedImagePath = await convertJpgToPng(selectedImage.path);
          if (convertedImagePath != null) {
            image.value = File(convertedImagePath);
            return true;
          } else {
            await showSnackbar(
              icon: '❗️',
              title: 'Image Conversion Failed',
              description: 'Error occurred while converting your JPG file',
            );
            return null;
          }
        } else {
          debugPrint('Unsupported image format selected.');
          // Show format error
          await showSnackbar(
            icon: '❗️',
            title: 'Unsupported Format',
            description: 'Please select a PNG image',
          );
          return null;
        }
      } else {
        debugPrint('Image selection canceled.');
        return null;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error message: ${errorMessage.value}');
      await showSnackbar(
          icon: '❗️',
          title: 'Image Selection Error',
          description: errorMessage.value);
    } finally {
      isConverting.value = false;
    }
    return null;
  }

  // Save segmented image to files
  Future<void> saveToFiles({required String imagePath}) async {
    try {
      // Get the directory to save the file
      debugPrint('Getting directory path...');
      final result = await FilePicker.platform.getDirectoryPath();

      if (result == null) {
        // User cancelled the directory selection
        debugPrint('Cancel directory selection');
      } else {
        debugPrint('Directory path: $result');
        final directory = Directory(result);

        // Ensure the directory exists
        debugPrint('Checking if directory exists...');
        if (!await directory.exists()) {
          debugPrint('The directory is being created...');
          await directory.create(recursive: true);
          debugPrint('The directory is created');
        }

        // Get the image file name
        final fileName = path.basename(imagePath);
        debugPrint('File name: $fileName');
        final savePath = path.join(directory.path, fileName);
        debugPrint('Selected directory path: ${directory.path}');

        // Copy the file to the selected directory
        final File sourceFile = File(imagePath);
        await sourceFile.copy(savePath);

        debugPrint('Image saved to: $savePath');
        await showSnackbar(
          icon: '✅',
          title: 'Save Successful',
          description: 'Image saved to your selected folder',
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error saving file: ${errorMessage.value}');
      await showSnackbar(
        icon: '❌',
        title: 'Save Failed',
        description: 'Failed to save image to folder: ${e.toString()}',
      );
    }
  }

  // Save segmented image to gallery
  Future<void> saveToGallery({required String imagePath}) async {
    try {
      debugPrint('Saving image to gallery: $imagePath');

      await Gal.putImage(imagePath);
      debugPrint('Saved the image');

      await showSnackbar(
        icon: '✅',
        title: 'Save Successful',
        description: 'Image saved to your gallery',
      );
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error saving to gallery: ${errorMessage.value}');
      await showSnackbar(
        icon: '❌',
        title: 'Save Failed',
        description: 'Failed to save image to gallery: ${e.toString()}',
      );
    }
  }
}
