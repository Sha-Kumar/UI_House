import 'package:UI_House/controllers/controllers.dart';
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
