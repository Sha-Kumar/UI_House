import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController controller = Get.find();
  TextEditingController email;
  TextEditingController pass;
  TextEditingController name;

  final isSigned = false.obs;
  final isPassVisible = true.obs;

  @override
  void onClose() {
    email.dispose();
    pass.dispose();
    name.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    name = TextEditingController();
    super.onInit();
  }
}
