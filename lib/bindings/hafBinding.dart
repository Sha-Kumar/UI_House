// import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/controllers/handfController.dart';
import 'package:get/get.dart';

class HAFBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HAndFController>(() {
      return Get.put(
        HAndFController(),
      );
    });
  }
}
