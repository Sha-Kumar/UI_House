import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:UI_House/services/services.dart';
import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/views/views.dart';

class StartView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 15.0,
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
              onPressed: () {
                controller.isSigned.value
                    ? Get.snackbar(
                        'sign1',
                        'Signout from the account first, Then sign-up with new account...',
                        duration: const Duration(milliseconds: 25),
                        snackPosition: SnackPosition.TOP,
                        colorText: Colors.blueAccent,
                      )
                    : Get.dialog(
                        AuthWidget(),
                      );
              },
              color: Colors.deepPurpleAccent,
              child: const Text(
                'Get Started',
                style:
                    TextStyle(color: Colors.white, fontFamily: "Lucida Sans"),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<User>(
          stream: FirebaseService().authChange,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Center(
                child: RaisedButton(
                  onPressed: () async {
                    controller.isSigned.value = false;
                    await FirebaseService().signOut();
                  },
                  child: const Text('sign out'),
                ),
              );
            }
            return ListView(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 270,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: const Color(0xffe6e6e6),
                              margin: const EdgeInsets.only(left: 20.0),
                              padding: const EdgeInsets.all(7.0),
                              child: const Text(
                                "W",
                                style: TextStyle(
                                    fontFamily: "Times New Roman",
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Text('Hello'),
                                Text('Hello'),
                                Text('Hello'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Hello'),
                                Text('Hello'),
                                Text('Hello'),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "© 2020 A wizard Corporation",
                                style: TextStyle(
                                  color: Color(0xff707070),
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
                )
              ],
            );
          }),
    );
  }
}
