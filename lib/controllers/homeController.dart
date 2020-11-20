import 'dart:async';
import 'package:UI_House/models/models.dart';
import 'package:UI_House/services/services.dart';
import 'package:UI_House/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  ScrollController homecontroller;
  final RxList photos = [].obs;
  final isLoading = false.obs;
  final firstView = true.obs;
  int max = 0;
  bool reset = true;

  @override
  void onInit() {
    reset = true;
    isLoading.value = true;
    print('in controller');
    homecontroller = ScrollController()
      ..addListener(
        () {
          if (homecontroller.position.pixels ==
              homecontroller.position.maxScrollExtent) {
            print('no');
            if (max >= 5 && firstView.value) {
              return;
            }
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
    homecontroller.dispose();
    super.onClose();
    // return super.onClose();
  }

  Future<void> fetch() async {
    // print('fetch');
    isLoading.value = true;
    final PhotoModel photo = await HomeService.instance.fetch(
      reset: reset,
      type: Type.loadPhotos,
      collectionReference: postCollection,
    ) as PhotoModel;
    reset = false;
    if (photo != null) {
      photos.addAll(photo.photos);
      max = photo.photos.length;
    } else {
      // print('went wrong');
    }
    isLoading.value = false;
  }
}
