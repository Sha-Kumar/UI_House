import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HAndFController extends GetxController {
  static HAndFController hAndFController = Get.find();
  TextEditingController desc;

  @override
  void onClose() {
    desc.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    desc = TextEditingController();
    // desc.text.split('\n');
    super.onInit();
  }
}
