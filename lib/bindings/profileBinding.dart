import 'package:UI_House/controllers/controllers.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<ProfileController>(
      () {
        return Get.put(
          ProfileController(),
          // permanent: true,
        );
      },
    );
  }
}
