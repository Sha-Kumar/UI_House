import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/routes.dart';
import 'package:UI_House/views/views.dart';
import 'package:UI_House/widgets/introFlagButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends GetView<AuthController> {
  final double screenWidth;
  final double screenHeight;

  const BottomBar({
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x00000000),
      width: double.infinity,
      height: screenHeight * (270 / 754.4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // color: Colors.pinkAccent,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.pinkAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent,
                        blurRadius: 7.5,
                        spreadRadius: 0.05,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "UI-HOUSE",
                    style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IntroPageFlatButton(
                      title: 'Home',
                      onPressed: () {
                        // Get.toNamed(startroute);
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    IntroPageFlatButton(
                      title: 'Getting Started',
                      onPressed: () {
                        controller.isSigned.value
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
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    IntroPageFlatButton(
                      title: 'Subscribe',
                      onPressed: () {
                        Get.toNamed(abtroute);
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    IntroPageFlatButton(
                      title: 'Have an account? Sign in',
                      onPressed: () {
                        controller.isSigned.value
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    IntroPageFlatButton(
                      title: 'About',
                      onPressed: () {
                        Get.toNamed(abtroute);
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IntroPageFlatButton(
                      title: 'Upload',
                      onPressed: () async {
                        if (controller.isSigned.value) {
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
                    const SizedBox(
                      width: 25,
                    ),
                    IntroPageFlatButton(
                      title: 'Get-It',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IntroPageFlatButton(
                      title: 'Help & Feedback',
                      onPressed: () {
                        Get.toNamed(hafroute);
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IntroPageFlatButton(
                      title: 'Contacts',
                      onPressed: () {
                        Get.toNamed(hafroute);
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IntroPageFlatButton(
                      title: 'Careers',
                      onPressed: () {
                        Get.toNamed(hafroute);
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IntroPageFlatButton(
                      title: 'Privacy',
                      onPressed: () {
                        Get.toNamed(abtroute);
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IntroPageFlatButton(
                      title: 'Terms',
                      onPressed: () {
                        Get.toNamed(abtroute);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: screenWidth - 60,
                    color: Colors.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    "© 2020 A UI-House Corporation",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Lucida Sans",
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
