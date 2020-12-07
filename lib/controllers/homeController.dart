import 'dart:async';
import 'package:UI_House/models/models.dart';
import 'package:UI_House/services/services.dart';
import 'package:UI_House/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController hcontroller = Get.find();

  ScrollController homecontroller;
  final RxList photos = [].obs;
  final RxInt minscroll = 0.obs;
  RxList likedPosts = [].obs;
  RxList savedPosts = [].obs;
  final isLoading = false.obs;
  RxInt likes;
  int max = 0;
  bool reset = true;

  Future<void> savePost(dynamic photoId) async {
    final int val = await HomeService.instance.saveOrUnSave(photoId);
    if (val == 0) {
      savedPosts.add(photoId);
      update();
      return;
    } else if (val == 1) {
      savedPosts.remove(photoId);
      update();
      return;
    } else {
      Get.snackbar('Error', 'Error in saving this image....');
    }
  }

  Future<void> likePost(dynamic photo, int postIndex) async {
    final int val = await HomeService.instance.likeOrDisLikePhoto(photo);
    if (val == 0) {
      likedPosts.add(photo.photoId);
      update();
      return;
    } else if (val == 1) {
      likedPosts.remove(photo.photoId);
      update();
    } else {
      Get.snackbar('Error', 'Error in liking this image....');
    }
  }

  @override
  void onInit() {
    reset = true;
    isLoading.value = true;
    likedPosts.addAll(likedPostsOfUser);
    savedPosts.addAll(savedPostsOfUser);

    update();
    print('in controller');
    homecontroller = ScrollController()
      ..addListener(
        () {
          if (homecontroller.position.pixels ==
              homecontroller.position.maxScrollExtent) {
            print('no');
            // if (max >= 5 && firstView.value) {
            //   return;
            // }
            fetch();
          }
          if (homecontroller.position.pixels <=
                  homecontroller.position.minScrollExtent &&
              max > 5) {
            minscroll.value += 1;
          }
          if (minscroll.value >= 3) {
            minscroll.value = 0;
            reset = true;
            photos.value = [];
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
  }

  Future<void> fetch() async {
    print('fetch');
    isLoading.value = true;
    final PhotoModel photo = await HomeService.instance.fetch(
      reset: reset,
      type: Type.loadPhotos,
      collectionReference: photoCollection,
    ) as PhotoModel;
    reset = false;
    if (photo != null) {
      photos.addAll(photo.photos);
      max = photo.photos.length;
    } else {
      print('went wrong');
    }
    isLoading.value = false;
  }
}
