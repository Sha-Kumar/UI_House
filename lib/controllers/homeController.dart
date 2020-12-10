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
  RxList likedPosts = [].obs;
  RxList savedPosts = [].obs;
  final name = nameOfUser.obs;

  final RxInt minscroll = 0.obs;
  RxInt photoCount = 0.obs;
  final isLoading = false.obs;
  final refreshCount = 0.obs;
  // final isUpdated = false.obs;

  int max = 0;
  bool reset = true;

  @override
  FutureOr onClose() {
    photos.clear();
    likedPosts.clear();
    savedPosts.cast();
    homecontroller.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    reset = true;
    isLoading.value = true;
    likedPosts.addAll(likedPostsOfUser);
    savedPosts.addAll(savedPostsOfUser);
    photoCount.value = postsOfUser.length;
    name.value = nameOfUser;

    update();
    print('in controller');
    homecontroller = ScrollController()
      ..addListener(
        () {
          photoCount.value = postsOfUser.length;

          if (homecontroller.position.pixels ==
              homecontroller.position.maxScrollExtent) {
            print('no');
            // if (max >= 5 && firstView.value) {
            //   return;
            // }
            photoCount.value = postsOfUser.length;
            fetch();
          }
          if (homecontroller.position.pixels <=
                  homecontroller.position.minScrollExtent &&
              max > 5) {
            minscroll.value += 1;
          }
          if (minscroll.value >= 3) {
            // likedPostsOfUser.clear();
            // likedPostsOfUser.addAll(likedPosts);
            minscroll.value = 0;
            reset = true;
            photos.value = [];
            refreshCount.value = 1;
            fetch();
          }
        },
      );
    fetch();
    super.onInit();
  }

  Future<void> fetch() async {
    name.value = nameOfUser;
    // photoCount.value = postsOfUser.length;

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

  Future<void> likePost(dynamic photoId) async {
    final int val = await HomeService.instance.likeOrDisLikePhoto(photoId);
    if (val == 0) {
      likedPosts.add(photoId);
      update();
      return;
    } else if (val == 1) {
      likedPosts.remove(photoId);
      update();
    } else {
      Get.snackbar('Error', 'Error in liking this image....');
    }
  }

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
}
