import 'dart:typed_data';

// import 'package:UI_House/services/firebaseServices.dart';
// import '';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:path/path.dart' as p;

class UploadController extends GetxController {
  String filename;
  String ext;
  Future<dynamic> uploadImage() async {
    final FilePickerResult img = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    filename = img.files[0].name;
    ext = img.files[0].extension;
    // print(filename);
    await uploadFile(img.files[0].bytes, filename, ext);
    // await FirebaseService().uploadImage(img.files[0].bytes, img.files[0].name);
  }

  Future<void> uploadFile(Uint8List file, String filename, String ext) async {
    try {
      final fb.StorageReference _storage = fb.storage().ref('test/$filename');
      final fb.UploadTaskSnapshot uploadTaskSnapshot = await _storage
          .put(file, fb.UploadMetadata(contentType: 'image/$ext'))
          .future;
      final Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      return imageUri.toString();
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
  }
}
