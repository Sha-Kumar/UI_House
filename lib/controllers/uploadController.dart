import 'dart:typed_data';

import 'package:UI_House/services/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  String filename;
  String ext;
  final service = FirebaseService();

  // final isLoading = false.obs;

  // @override
  // void onInit() {
  //   isLoading.value = true;
  //   Future.delayed(
  //     const Duration(seconds: 10),
  //     () => Get.dialog(
  //       const Center(
  //         child: CircularProgressIndicator(
  //           backgroundColor: Colo,
  //         ),
  //       ),
  //       barrierDismissible: false,
  //     ),
  //   );
  //   uploadImage();
  //   super.onInit();
  // }

  Future<void> uploadImage() async {
    final FilePickerResult img = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    filename = img.files[0].name;
    ext = img.files[0].extension;
    print(filename);
    print(ext);

    if (await uploadFile(img.files[0].bytes, filename, ext)) {
      Get.snackbar(
        'Upload Successful',
        'Successfully uploaded the image $filename to the UI_House',
        duration: const Duration(
          seconds: 2,
        ),
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        'Upload problem',
        'Not able to upload, try again later !!!',
        duration: const Duration(
          seconds: 2,
        ),
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<bool> uploadFile(Uint8List file, String filename, String ext) async {
    try {
      final fb.StorageReference _storage = fb.storage().ref('test/$filename');
      final fb.UploadTaskSnapshot uploadTaskSnapshot = await _storage
          .put(file, fb.UploadMetadata(contentType: 'image/$ext'))
          .future;

      final Uri imageUrl = await uploadTaskSnapshot.ref.getDownloadURL();

      service.uploadImageURLToCollection(imageUrl.toString());

      return true;
    } catch (e) {
      Get.snackbar(
        'Upload problem',
        'Not able to upload, try again later !!!',
        duration: const Duration(
          seconds: 2,
        ),
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: SnackPosition.TOP,
      );
    }
    return false;
  }
}
