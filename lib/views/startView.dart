import 'package:UI_House/widgets/introFlagButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:UI_House/services/services.dart';
import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/views/views.dart';

class StartView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 18.0,
        // bottom: PreferredSize(
        //   child: Container(
        //     // color: Colors.black,
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
        //       // boxShadow:
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
          FlatButton(
            onPressed: () {},
            child: const Text('About'),
          ),
          FlatButton(
            onPressed: () {},
            child: const Text('Upload'),
          ),
          StreamBuilder<User>(
              stream: FirebaseService().authChange,
              builder: (context, snapshot) {
                return FlatButton(
                  child: Text(
                    controller.isSigned.value ? 'SignOut' : 'SignIn',
                  ),
                  onPressed: () async {
                    controller.isSigned.value
                        ? await FirebaseService().signOut()
                        : Get.dialog(
                            SigninView(),
                          );
                    if (controller.isSigned.value)
                      controller.isSigned.value = false;
                  },
                );
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 35, 10),
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
                style:
                    TextStyle(color: Colors.white, fontFamily: "Lucida Sans"),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: screenHeight * (550 / 754.4),
            width: screenWidth,
            alignment: Alignment.center,
            color: Color.fromRGBO(0, 0, 1, 0.02),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: screenWidth / 2 - 10,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all((screenHeight * 75) / 550),
                      child: Column(
                        children: [
                          Text(
                            "Discover the world’s top designers & creatives.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 41,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lucida Sans",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "UI-House is the leading destination to find & showcase creative work and home to that of world's best design professionals.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lucida Sans",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "To get started in the world of designs and creative work opt me,",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lucida Sans",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                              padding: const EdgeInsets.all(18.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
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
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lucida Sans",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth / 2 - 10,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('projectphoto.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 0.5,
            width: double.infinity,
            color: Colors.blueAccent,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Color(0x00000000),
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
                        decoration: BoxDecoration(
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
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          IntroPageFlatButton(
                            title: 'Getting Started',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          IntroPageFlatButton(
                            title: 'Subscribe',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          IntroPageFlatButton(
                            title: 'Have an account? Sign in',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IntroPageFlatButton(
                            title: 'About',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IntroPageFlatButton(
                            title: 'Upload',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IntroPageFlatButton(
                            title: 'Get-It',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IntroPageFlatButton(
                            title: 'Help & Feedback',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IntroPageFlatButton(
                            title: 'Contacts',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IntroPageFlatButton(
                            title: 'Careers',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IntroPageFlatButton(
                            title: 'Privacy',
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          IntroPageFlatButton(
                            title: 'Terms',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
          ),
        ],
      ),
    );
  }
}
