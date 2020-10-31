import 'dart:async';
import 'package:UI_House/models/models.dart';
import 'package:UI_House/services/services.dart';
import 'package:UI_House/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  ScrollController controller;
  final RxList photos = [].obs;
  final isLoading = false.obs;
  bool reset = true;

  @override
  void onInit() {
    reset = true;
    isLoading.value = true;
    print('in controller');
    controller = ScrollController()
      ..addListener(
        () {
          if (controller.position.pixels ==
              controller.position.maxScrollExtent) {
            print('no');
            fetch();
          }
        },
      );
    fetch();
    super.onInit();
  }

  @override
  FutureOr onClose() {
    photos.clear();
    controller.dispose();
    super.onClose();
    // return super.onClose();
  }

  Future<void> fetch() async {
    // print('fetch');
    isLoading.value = true;
    final PhotoModel kural = await HomeService.instance.fetch(
      reset: reset,
      type: Type.loadPhotos,
      collectionReference: photosCollection,
    ) as PhotoModel;
    reset = false;
    if (kural != null) {
      photos.addAll(kural.photos);
    } else {
      // print('went wrong');
    }
    isLoading.value = false;
  }
}
