import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:firebase/firebase.dart' as fb;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';

class UploadController extends GetxController {
  // static UploadController uploadcontroller = Get.find();

  Future<MediaInfo> imagePicker() async {
    MediaInfo mediaInfo = await ImagePickerWeb.getImageInfo;
    return mediaInfo;
  }

  Future<Uri> uploadFile(
      MediaInfo mediaInfo, String ref, String fileName) async {
    try {
      String mimeType = mime(basename(mediaInfo.fileName));

      // html.File mediaFile =
      //     new html.File(mediaInfo.data, mediaInfo.fileName, {'type': mimeType});
      final String extension = extensionFromMime(mimeType);

      var metadata = fb.UploadMetadata(
        contentType: mimeType,
      );

      fb.StorageReference storageReference =
          fb.storage().ref(ref).child(fileName + ".$extension");

      fb.UploadTaskSnapshot uploadTaskSnapshot =
          await storageReference.put(mediaInfo.data, metadata).future;

      Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      print("download url $imageUri");
      return imageUri;
    } catch (e) {
      print("File Upload Error $e");
      return null;
    }
  }
}
