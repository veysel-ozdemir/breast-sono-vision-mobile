import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

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
              title: 'image_conversion_failed'.tr,
              description: 'image_conversion_failed_description'.tr,
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
        title: 'file_selection_error'.tr,
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
              title: 'image_conversion_failed'.tr,
              description: 'image_conversion_failed_description'.tr,
            );
            return null;
          }
        } else {
          debugPrint('Unsupported image format selected.');
          // Show format error
          await showSnackbar(
            icon: '❗️',
            title: 'unsupported_format'.tr,
            description: 'unsupported_format_description'.tr,
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
          title: 'image_selection_error'.tr,
          description: errorMessage.value);
    } finally {
      isConverting.value = false;
    }
    return null;
  }

  // Share segmented image
  Future<bool> share({required String imagePath}) async {
    try {
      debugPrint('The image is being shared...');
      final result = await SharePlus.instance.share(
        ShareParams(
          title: path.basename(imagePath),
          files: [XFile(imagePath)],
        ),
      );
      debugPrint(result.toString());
      if (result.status == ShareResultStatus.success) {
        await showSnackbar(
          icon: '✅',
          title: 'share_successful'.tr,
          description: 'share_successful_description'.tr,
        );
        return true;
      } else if (result.status == ShareResultStatus.unavailable) {
        throw Exception(
            'The platform succeed to share content to user but the user action can not be determined');
      } else {
        debugPrint('Dismissed the share-sheet');
        return false;
      }
    } on PathAccessException catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error saving file: ${errorMessage.value}');
      await showSnackbar(
        icon: '🔒',
        title: 'save_failed'.tr,
        description: 'save_failed_description'.tr,
      );
      return false;
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error sharing file: ${errorMessage.value}');
      await showSnackbar(
        icon: '❌',
        title: 'share_failed'.tr,
        description: '${'share_failed_description'.tr}: ${e.toString()}',
      );
      return false;
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
        title: 'save_successful'.tr,
        description: 'save_successful_description'.tr,
      );
    } catch (e) {
      errorMessage.value = e.toString();
      debugPrint('Error saving to gallery: ${errorMessage.value}');
      await showSnackbar(
        icon: '❌',
        title: 'save_failed'.tr,
        description: '${'save_failed_description_gallery'.tr}: ${e.toString()}',
      );
    }
  }
}
