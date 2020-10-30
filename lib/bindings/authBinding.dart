import 'package:UI_House/controllers/authController.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () {
        return Get.put(
          AuthController(),
          permanent: true,
        );
      },
    );
  }
}
