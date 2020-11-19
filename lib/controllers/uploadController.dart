import 'package:UI_House/services/firebaseServices.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  Future<dynamic> uploadImage() async {
    final FilePickerResult img = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    await FirebaseService().uploadImage(img.files[0].bytes, img.files[0].name);
  }
}
//Image.memory(Uint8List bytes)

// final StorageTaskSnapshot snapshot = await _storage
//     .ref()
//     .child('/assets/')
//     .putFile(img.files[0])
//     .onComplete;
// return  snapshot.ref.getName();
// return await snapshot.ref.getDownloadURL().toString();
