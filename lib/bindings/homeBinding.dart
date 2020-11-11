import 'package:UI_House/controllers/controllers.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () {
        Get.put(AuthController());
        return Get.put(
          HomeController(),
          permanent: true,
        );
      },
    );
  }
}
