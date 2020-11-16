import 'dart:async';
import 'package:mime_type/mime_type.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class UploadController extends GetxController {
  static UploadController get to => Get.find();

  imagePicker() {
    return ImagePickerWeb.getImageInfo.then((mediaInfo) async {
      //uploadFile(mediaInfo, 'images', mediaInfo.fileName);
    });
  }
/*
  //Getting Downloaded URI directly
  uploadFile(MediaInfo mediaInfo, String ref, String fileName) {
    try {
      String mimeType = mime(basename(mediaInfo.fileName));
      var metaData = UploadMetadata(contentType: mimeType);
      StorageReference storageReference = storage().ref(ref).child(fileName);

      UploadTask uploadTask = storageReference.put(mediaInfo.data, metaData);
      var imageUri;
      uploadTask.future.then((snapshot) => {
            Future.delayed(Duration(seconds: 1)).then((value) => {
                  snapshot.ref.getDownloadURL().then((dynamic uri) {
                    imageUri = uri;
                    print('Download URL: ${imageUri.toString()}');
                  })
                })
          });
    } catch (e) {
      print('File Upload Error: $e');
    }
  }

//OR You can return Future Download URI
  Future<Uri> uploadFile1(
      MediaInfo mediaInfo, String ref, String fileName) async {
    try {
      String mimeType = mime(basename(mediaInfo.fileName));
      var metaData = UploadMetadata(contentType: mimeType);
      StorageReference storageReference = storage().ref(ref).child(fileName);

      UploadTaskSnapshot uploadTaskSnapshot =
          await storageReference.put(mediaInfo.data, metaData).future;
      Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      print('Download URL: $imageUri');
      return imageUri;
    } catch (e) {
      print('File Upload Error: $e');
      return null;
    }
  }*/
}
