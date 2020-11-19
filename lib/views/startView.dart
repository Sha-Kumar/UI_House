import 'package:UI_House/views/views.dart';
import 'package:UI_House/widgets/homeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/widgets/widgets.dart';

class StartView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
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
              if (controller.isSigned.value) {
                UploadController up = UploadController();
                up.uploadImage();
              }
              // print(await up.uploadImage().toString());
              // controller.isSigned.value ? print('Hello') : print('Nooro');
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
                gradient: LinearGradient(
                  begin: const Alignment(0.7, -0.5),
                  end: const Alignment(0.6, 0.5),
                  colors: [
                    Color(0xFF53a78c),
                    Color(0xFF70d88b),
                  ],
                ),
              ),
              child: Icon(
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
        // bottom: PreferredSize(
        //   child: Container(
        //     height: 1.0,
        //     decoration: BoxDecoration(
        //       color: Colors.black,
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black54,
        //     blurRadius: 15.0,
        //     offset: Offset(0, 1),
        //   ),
        // ],
        //     ),
        //   ),
        //   preferredSize: Size.fromHeight(4.0),
        // ),
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
          HomeButton(description: 'About'),
          HomeButton(description: 'Help & Feedback'),
          HomeButton(description: 'Upload'),
          InOutWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              25,
              10,
              35,
              10,
            ),
            child: RaisedButton(
              padding: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
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
      body: Obx(
        () => controller.isSigned.value
            ? HomeWidget(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              )
            : StartWidget(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
      ),
    );
  }
}
