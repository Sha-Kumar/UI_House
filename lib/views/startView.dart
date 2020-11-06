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
          const SizedBox(
            height: 25,
          ),
          Container(
            height: screenHeight * (375 / 754.4),
            width: screenWidth,
            alignment: Alignment.center,
            color: Colors.red,
            child: Text('Hello'),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            color: Colors.grey,
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
                        color: Colors.pinkAccent,
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
                          width: screenWidth-60,
                          color: Colors.white,
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

// Container(
//   child: Text('hello1'),
// ),
// Container(
//   child: Text('hello2'),
// ),
// Container(
//   child: Text('hello3'),
// ),
// Container(
//   child: Text('hello4'),
// ),
// SizedBox(
//   height: 50,
// ),
// Text('Yes'),
// Row(
//   children: [
//     Padding(
//       padding: const EdgeInsets.only(left: 18.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             color: Colors.pinkAccent,
//             margin: const EdgeInsets.only(left: 20.0),
//             padding: const EdgeInsets.all(7.0),
//             child: const Text(
//               "UI-House",
//               style: TextStyle(
//                 fontFamily: "Times New Roman",
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 20.0),
//             padding: const EdgeInsets.all(7.0),
//             width: 200,
//             child: const Text(
//               "UI-House is the useful by community for creatives to share, grow, and to explore.",
//               style: TextStyle(
//                 fontFamily: "Times New Roman",
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//               textDirection: TextDirection.ltr,
//               overflow: TextOverflow.clip,
//               maxLines: 4,
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(left: 20.0),
//                 padding: const EdgeInsets.all(7.0),
//                 child: const Text(
//                   "UI-House",
//                   style: TextStyle(
//                       fontFamily: "Times New Roman",
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.pinkAccent),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 20.0),
//                 padding: const EdgeInsets.all(7.0),
//                 child: const Text(
//                   "UI-House",
//                   style: TextStyle(
//                       fontFamily: "Times New Roman",
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.pinkAccent),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 20.0),
//                 padding: const EdgeInsets.all(7.0),
//                 child: const Text(
//                   "UI-House",
//                   style: TextStyle(
//                       fontFamily: "Times New Roman",
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.pinkAccent),
//                 ),
//               ),
//             ],
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 20.0),
//             child: Text(
//               "© 2020 A UI-House Corporation",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontFamily: "Lucida Sans",
//                 fontSize: 15,
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   ],
// ),
