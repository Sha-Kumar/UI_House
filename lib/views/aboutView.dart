import 'dart:ui';

import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/views/views.dart';
import 'package:UI_House/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UI_House/routes.dart';

class AboutView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
        titleSpacing: 70,
        automaticallyImplyLeading: false,
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
            description: 'home',
            onPressed: () {
              Get.back();
            },
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
      body: ListView(
        children: [
          const SizedBox(
            height: 300,
            child: Center(
              child: Text(
                'Every design and creativity needs a UI-House',
                style: TextStyle(
                  fontSize: 106,
                  fontFamily: 'Georgia',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'The best designs can change the development path and speed. UI-House is where those creatives take shape, take off, and spark powerful conversations. We’re an open platform where millions of people come to find insightful and dynamic creatives. Here, expert and undiscovered creatives alike dive into the heart of any user interface design or other designs and bring new designs to the surface. Our purpose is to spread these designs and ui designs and reduce the development work.',
                        style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'Georgia',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'Georgia',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 700,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  padding: const EdgeInsets.all(7.0),
                  child: const Text(
                    "UI",
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 600,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: const Color(0xfff9d0b8),
            height: 750,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 290.0),
              child: Column(
                children: const [
                  Spacer(),
                  Text(
                    "UI-House is the leading destination to find & showcase creative work and home to the world's best user interface design professionals.",
                    style: TextStyle(
                      fontSize: 85,
                      fontFamily: 'Georgia',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Spacer(),
                  Text(
                    'UI-Hous is the go-to resource for discovering and connecting with designers and creative talent around the globe. Our platform is the ideal inspiration tool. Exploring ideas and visualizing directions for any project, no matter how big or small, no matter what type of design is called for, is easy thanks to the output of our incredibly prolific and diverse community.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Soehne web buch',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 380,
            child: Column(
              children: const [
                SizedBox(
                  width: 1200,
                  child: Text(
                    'Create the space for your ',
                    style: TextStyle(
                        fontSize: 106,
                        color: Colors.white,
                        fontFamily: 'Georgia',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 1000,
                    child: Text(
                      'creativity to take off.',
                      style: TextStyle(
                          fontSize: 106,
                          color: Colors.white,
                          fontFamily: 'Georgia',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 800,
                    child: Text(
                      "A random ui design page is also a door. At UI-House you can walk through it. It's easy and free to share your creatives on any design aspects, connect with an users and developers, express yourself with a range of publishing tools, and even earn money for your work.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Soehne web buch',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
