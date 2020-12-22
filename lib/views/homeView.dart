import 'package:UI_House/constants/constants.dart';
import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/routes.dart';
import 'package:UI_House/views/views.dart';
import 'package:UI_House/widgets/homeButton.dart';
import 'package:UI_House/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          right: 20,
        ),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            tooltip: 'Upload a New Design',
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () async {
              Get.put(UploadController());
              if (AuthController.controller.isSigned.value) {
                Get.dialog(UploadView());
              } else {
                Get.snackbar(
                  'Error - Not Signed-In',
                  'Unable to upload without login',
                  colorText: Colors.white,
                  backgroundColor: Colors.black87,
                  duration: const Duration(
                    seconds: 2,
                  ),
                  snackPosition: SnackPosition.TOP,
                );
              }
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 4,
                ),
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment(0.7, -0.5),
                  end: Alignment(0.6, 0.5),
                  colors: [
                    Color(0xFF53a78c),
                    Color(0xFF70d88b),
                  ],
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 50,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 18.0,
        backgroundColor: Colors.transparent,
        titleSpacing: 70,
        title: const Text(
          'UI-HOUSE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            fontFamily: "Helvetica Neue",
          ),
        ),
        actions: [
          HomeButton(
            description: 'About',
            onPressed: () {},
          ),
          HomeButton(
            description: 'Help & Contact',
            onPressed: () {
              Get.toNamed(hafroute);
            },
          ),
          HomeButton(
            description: 'Upload',
            onPressed: () async {
              Get.put(UploadController());
              if (AuthController.controller.isSigned.value) {
                Get.dialog(UploadView());
              } else {
                Get.snackbar(
                  'Error - Not Signed-In',
                  'Unable to upload without login',
                  colorText: Colors.white,
                  backgroundColor: Colors.black87,
                  duration: const Duration(
                    seconds: 2,
                  ),
                  snackPosition: SnackPosition.TOP,
                );
              }
            },
          ),
          const InOutWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              25,
              10,
              35,
              10,
            ),
            child: RaisedButton(
              padding: const EdgeInsets.all(10.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              onPressed: () {
                print(AuthController.controller.isSigned.value);
                AuthController.controller.isSigned.value
                    // // ? Get.back()
                    ? Get.snackbar(
                        'SignOut - First',
                        'Signout from the account first, Then sign-up with new account...',
                        duration: const Duration(
                          seconds: 2,
                        ),
                        snackPosition: SnackPosition.TOP,
                        colorText: Colors.blueAccent,
                        backgroundColor: Colors.black87,
                      )
                    : Get.dialog(
                        AuthWidget(),
                      );
              },
              color: Colors.pinkAccent,
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Lucida Sans",
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: screenWidth,
              height: screenHeight * (550 / 754.4) + 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          top: 65,
                          right: 25,
                          bottom: 18,
                        ),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 77.5,
                            backgroundColor: Colors.pinkAccent,
                            child: CircleAvatar(
                              radius: 75,
                              backgroundColor: Colors.black,
                              child: Obx(() => Container(
                                    child: controller.photoSet.value
                                        ? ClipOval(
                                            child: Image.network(
                                              photoOfUser.toString(),
                                              fit: BoxFit.fill,
                                              repeat: ImageRepeat.repeat,
                                            ),
                                          )
                                        : const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 100.0,
                                          ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          top: 5,
                          right: 25,
                          bottom: 10,
                        ),
                        child: Container(
                          height: screenHeight * (550 / 754.4) * 0.45 + 50,
                          width: screenWidth * 0.45,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Obx(
                                () => Text(
                                  '😁😁😁 ${controller.name.value} 😁😁😁',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 1.0,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Welcome back 👋 to the Profile and contribute for designs and creativity !👋👋👋',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: RaisedButton(
                                      padding: const EdgeInsets.all(18.0),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(7),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Get.put(UploadController());
                                        if (AuthController
                                            .controller.isSigned.value) {
                                          Get.dialog(UploadView());
                                        }
                                      },
                                      color: Colors.pinkAccent,
                                      child: const Text(
                                        'Upload',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Lucida Sans",
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: RaisedButton(
                                      padding: const EdgeInsets.all(18.0),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(7),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.toNamed(profilrroute);
                                      },
                                      color: Colors.pinkAccent,
                                      child: const Text(
                                        'Profile',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Lucida Sans",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 1.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: screenWidth / 2 - 10,
                    alignment: Alignment.center,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('projectphoto.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonTheme(
                          height: 50,
                          minWidth: 120,
                          hoverColor: Colors.grey,
                          child: Obx(
                            () => RaisedButton(
                              padding: const EdgeInsets.all(18.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              onPressed: () {
                                controller.dropval.value = 1;
                                controller.butcol.value = 1;
                                controller.started();
                              },
                              color: (controller.butcol.value == 1)
                                  ? Colors.pink
                                  : Colors.white,
                              child: const Text(
                                'All',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lucida Sans",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonTheme(
                          height: 50,
                          minWidth: 55,
                          hoverColor: Colors.grey,
                          child: Obx(
                            () => RaisedButton(
                              padding: const EdgeInsets.all(18.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              onPressed: () {
                                controller.dropval.value = 2;
                                controller.butcol.value = 2;
                                controller.started();
                              },
                              color: (controller.butcol.value == 2)
                                  ? Colors.pink
                                  : Colors.white,
                              child: Text(
                                'Shots - ${controller.photoCount.value}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lucida Sans",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonTheme(
                          hoverColor: Colors.grey,
                          height: 50,
                          minWidth: 150,
                          child: Obx(
                            () => RaisedButton(
                              padding: const EdgeInsets.all(18.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              onPressed: () {
                                controller.dropval.value = 4;
                                controller.butcol.value = 4;
                                controller.started();
                              },
                              color: (controller.butcol.value == 4)
                                  ? Colors.pink
                                  : Colors.white,
                              child: Text(
                                'Liked Shots - ${controller.likedPosts.length}',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lucida Sans",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonTheme(
                          height: 50,
                          hoverColor: Colors.grey,
                          minWidth: 150,
                          child: Obx(
                            () => RaisedButton(
                              padding: const EdgeInsets.all(18.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              onPressed: () {
                                controller.dropval.value = 3;
                                controller.butcol.value = 3;
                                controller.started();
                              },
                              color: (controller.butcol.value == 3)
                                  ? Colors.pink
                                  : Colors.white,
                              child: Text(
                                'Saved Shots - ${controller.savedPosts.length}',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lucida Sans",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.48,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,
                          width: 145,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 0.1,
                                offset: Offset(1, 1),
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButtonHideUnderline(
                              child: Obx(
                                () => DropdownButton(
                                  focusColor: Colors.grey,
                                  value: controller.dropval.value,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Text("All"),
                                    ),
                                    DropdownMenuItem(
                                      value: 2,
                                      child: Text("Shotted"),
                                    ),
                                    DropdownMenuItem(
                                      value: 3,
                                      child: Text("Saved"),
                                    ),
                                    DropdownMenuItem(
                                      value: 4,
                                      child: Text("Liked"),
                                    )
                                  ],
                                  onChanged: (value) {
                                    controller.dropval.value = value as int;
                                    controller.butcol.value = value as int;
                                    controller.started();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 2,
                        left: 25,
                        right: 25,
                      ),
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: screenHeight * 0.6,
                        child: GridView.builder(
                            controller: controller.homecontroller,
                            shrinkWrap: true,
                            itemCount: controller.photos.length,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.05,
                            ),
                            itemBuilder: (context, index) {
                              if (controller.photos.isEmpty) {
                                return const Center(
                                  child: Card(
                                    child: Text('End'),
                                  ),
                                  //  CircularProgressIndicator(
                                  //   strokeWidth: 10,
                                  //   valueColor: AlwaysStoppedAnimation<Color>(
                                  //     Colors.blue,
                                  //   ),
                                  // ),
                                );
                              }
                              // else {
                              return Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                    width: 0.5,
                                    color: Colors.blueGrey.withOpacity(0.5),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: screenHeight * (250 / 754.4),
                                        width: screenWidth * (345 / 1536),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25.0),
                                          ),
                                          color: Colors.amber,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.network(
                                            controller.photos[index].photoUrl
                                                .toString(),
                                            fit: BoxFit.fill,
                                            repeat: ImageRepeat.repeat,
                                            // scale: ,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        child: Container(
                                          height: 0.5,
                                          width: double.infinity,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Text(
                                              controller.photos[index].title
                                                  .toString(),
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: (screenHeight /
                                                        screenWidth) *
                                                    (1 / screenRatio) *
                                                    18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 2,
                                                  right: 3,
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await controller.savePost(
                                                        controller.photos[index]
                                                            .photoId);
                                                  },
                                                  child: Obx(
                                                    () => Icon(
                                                      Icons.bookmark,
                                                      color: controller
                                                              .savedPosts
                                                              .contains(
                                                                  controller
                                                                      .photos[
                                                                          index]
                                                                      .photoId)
                                                          ? Colors.yellowAccent
                                                          : Colors.black,
                                                      // size: ,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 3.0,
                                                  right: 2.0,
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    controller.likePost(
                                                      await controller
                                                          .photos[index]
                                                          .photoId,
                                                    );
                                                  },
                                                  child: Obx(
                                                    () => Icon(
                                                      Icons.thumb_up,
                                                      color: controller
                                                              .likedPosts
                                                              .contains(
                                                                  controller
                                                                      .photos[
                                                                          index]
                                                                      .photoId)
                                                          ? Colors.blue
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 3.0,
                                                  right: 2.0,
                                                ),
                                                child: Obx(
                                                  () => Text(
                                                    (likedPostsOfUser.contains(
                                                            controller
                                                                .photos[index]
                                                                .photoId))
                                                        ? controller.likedPosts
                                                                .contains(controller
                                                                    .photos[
                                                                        index]
                                                                    .photoId)
                                                            ? (controller
                                                                    .photos[
                                                                        index]
                                                                    .likes)
                                                                .toString()
                                                            : (controller
                                                                        .photos[
                                                                            index]
                                                                        .likes -
                                                                    1)
                                                                .toString()
                                                        : controller.likedPosts
                                                                .contains(
                                                                    controller
                                                                        .photos[
                                                                            index]
                                                                        .photoId)
                                                            ? (controller
                                                                        .photos[
                                                                            index]
                                                                        .likes +
                                                                    1)
                                                                .toString()
                                                            : (controller
                                                                    .photos[index]
                                                                    .likes)
                                                                .toString(),
                                                    style: TextStyle(
                                                      fontSize: (screenHeight /
                                                              screenWidth) *
                                                          (1 / screenRatio) *
                                                          18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              // }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2,
                left: 35,
                right: 35,
                bottom: 35,
              ),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.black,
              ),
            ),
            BottomBar(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
