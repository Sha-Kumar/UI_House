import 'dart:typed_data';

import 'package:UI_House/services/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  // static UploadController uploadController = Get.find();

  static String filename;
  static String ext;
  final service = FirebaseService();
  TextEditingController title;
  final isUploaded = false.obs;

  Uint8List upimg;

  @override
  void onClose() {
    title.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    title = TextEditingController();
    super.onInit();
  }

  Future<void> uploadImage() async {
    final FilePickerResult img = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    filename = img.files[0].name;
    ext = img.files[0].extension;

    upimg = img.files[0].bytes;
    isUploaded.value = true;

    // print(filename);
    // print(ext);

    // if (await uploadFile(img.files[0].bytes, filename, ext)) {
    //   Get.snackbar(
    //     'Upload Successful',
    //     'Successfully uploaded the image $filename to the UI_House',
    //     duration: const Duration(
    //       seconds: 2,
    //     ),
    //     colorText: Colors.white,
    //     backgroundColor: Colors.black87,
    //     snackPosition: SnackPosition.TOP,
    //   );
    // } else {
    //   Get.snackbar(
    //     'Upload problem',
    //     'Not able to upload, try again later !!!',
    //     duration: const Duration(
    //       seconds: 2,
    //     ),
    //     colorText: Colors.white,
    //     backgroundColor: Colors.black87,
    //     snackPosition: SnackPosition.TOP,
    //   );
    // }
  }

  Future<void> nextUpload() async {
    print(filename);
    print(title.text.trim().toString());

    if (await uploadFile(upimg, filename, ext, title.text.trim().toString())) {
      print('Done');
      // Get.snackbar(
      //   'Upload Successful',
      //   'Successfully uploaded the image $filename to the UI_House',
      //   duration: const Duration(
      //     seconds: 2,
      //   ),
      //   colorText: Colors.white,
      //   backgroundColor: Colors.black87,
      //   snackPosition: SnackPosition.TOP,
      // );
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

  Future<bool> uploadFile(
      Uint8List file, String filename, String ext, String tit) async {
    try {
      final fb.StorageReference _storage = fb.storage().ref('test/$filename');
      final fb.UploadTaskSnapshot uploadTaskSnapshot = await _storage
          .put(file, fb.UploadMetadata(contentType: 'image/$ext'))
          .future;

      final Uri imageUrl = await uploadTaskSnapshot.ref.getDownloadURL();

      print(imageUrl.toString());

      service.uploadImageURLToCollection(imageUrl.toString(), tit);

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
