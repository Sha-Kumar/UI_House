import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/routes.dart';
import 'package:UI_House/views/views.dart';
import 'package:UI_House/widgets/homeButton.dart';
import 'package:UI_House/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends GetView<HomeController> {
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
            description: 'Help & Feedback',
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
                    // ? Get.back()
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
        () => ListView(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: screenWidth,
              height: screenHeight * (550 / 754.4) + 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 65,
                          right: 25,
                          bottom: 25,
                        ),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 52.5,
                            backgroundColor: Colors.pinkAccent,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 85.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          top: 10,
                          right: 25,
                          bottom: 10,
                        ),
                        child: Container(
                          height: screenHeight * (550 / 754.4) * 0.45 + 50,
                          width: screenWidth * 0.45,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                '😁😁😁  Shashank Kumar  😁😁😁',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
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
                                      onPressed: () {},
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
                          child: RaisedButton(
                            padding: const EdgeInsets.all(18.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            child: const Text(
                              'Shots - 121212',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lucida Sans",
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
                          child: RaisedButton(
                            padding: const EdgeInsets.all(18.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            child: const Text(
                              'Liked Shots - 121212',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lucida Sans",
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
                          child: RaisedButton(
                            padding: const EdgeInsets.all(18.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            child: const Text(
                              'Saved Shots - 121212',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lucida Sans",
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
                          child: RaisedButton(
                            padding: const EdgeInsets.all(18.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            child: const Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lucida Sans",
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                              child: DropdownButton(
                                focusColor: Colors.grey,
                                value: 1,
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
                                onChanged: (value) {},
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

                  // Expanded(
                  // ignore: sized_box_for_whitespace
                  // Container(
                  //   height: screenHeight * 0.85,
                  //   child:
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: GridView.builder(
                        controller: controller.homecontroller,
                        shrinkWrap: true,
                        itemCount: controller.photos.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          if (controller.photos.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 10,
                              ),
                            );
                          }
                          return
                              // Container(
                              //   child:
                              Text(controller.photos[index].title.toString());
                          // );
                        }),
                  ),
                  // ),
                  // ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
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
      ),
    );
  }
}
// Container(
//   height: screenHeight * 0.5,
//   width: screenWidth,
//   // flex: 2,
//   child: Obx(() {
//     return GridView.builder(
//       padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//       controller: controller.homecontroller,
//       itemCount: controller.photos.length,
//       itemBuilder: (context, index) {
//         if (controller.photos.isEmpty) {
//           return const Center(
//               child: CircularProgressIndicator());
//         }
//         return Container(
//           child: Text(
//             controller.photos[index].title.toString(),
//           ),
//         );
//         // return Card(
//         //   shape: RoundedRectangleBorder(
//         //     borderRadius: BorderRadius.circular(25.0),
//         //     side: BorderSide(
//         //       width: 2,
//         //       color: Colors.cyan.withOpacity(0.8),
//         //       // style: BorderStyle.solid,
//         //     ),
//         //   ),
//         //   child: Column(
//         //     children: <Widget>[
//         //       SizedBox(
//         //         height: 30,
//         //         child: Text(
//         //           controller.photos[index].value.title
//         //               .toString(),
//         //         ),
//         //         // child: ListView(
//         //         //   padding: const EdgeInsets.only(
//         //         //     left: 20,
//         //         //     right: 20,
//         //         //     top: 10,
//         //         //   ),
//         //         //   physics: const BouncingScrollPhysics(),
//         //         //   shrinkWrap: true,
//         //         //   scrollDirection: Axis.horizontal,
//         //         //   children: <Widget>[
//         //         //     InkWell(
//         //         //       onTap: () => controller.homecontroller
//         //         //           .jumpTo(controller.homecontroller
//         //         //               .position.minScrollExtent),
//         //         //       child: Text(
//         //         //         // kural.kurals[index].chapter,
//         //         //         controller.photos[index].title
//         //         //             .toString(),
//         //         //         style: const TextStyle(
//         //         //           fontSize: 15,
//         //         //           color: Colors.purple,
//         //         //         ),
//         //         //       ),
//         //         //     ),
//         //         //     SizedBox(
//         //         //       height: 20,
//         //         //       child: VerticalDivider(
//         //         //         color: Colors.redAccent[400],
//         //         //         // thickness: 2,
//         //         //       ),
//         //         //     ),
//         //         //     // InkWell(
//         //         //     //   onTap: () => controller.controller.jumpTo(
//         //         //     //       controller
//         //         //     //           .controller.position.maxScrollExtent),
//         //         //     //   child: Text(
//         //         //     //     controller.kurals[index].section.toString(),
//         //         //     //     style: const TextStyle(
//         //         //     //         fontSize: 15, color: Colors.purple),
//         //         //     //   ),
//         //         //     // ),
//         //         //   ],
//         //         // ),
//         //         // ),
//         //         // const Divider(
//         //         //   height: 10,
//         //         //   color: Colors.orange,
//         //         // ),
//         //         // ListTile(
//         //         //   contentPadding: const EdgeInsets.only(
//         //         //     bottom: 20,
//         //         //     left: 15,
//         //         //   ),
//         //         //   title: Text(
//         //         //     controller.photos[index].title.toString(),
//         //         //     style: const TextStyle(
//         //         //       fontSize: 15,
//         //         //       color: Colors.indigoAccent,
//         //         //     ),
//         //         //   ),
//         //         // subtitle: Text(
//         //         //   '${controller.photos[index].kural[1]} [${controller.photos[index].number}]',
//         //         //   style: const TextStyle(
//         //         //       fontSize: 14, color: Colors.indigo),
//         //         // ),
//         //       ),
//         //     ],
//         //   ),
//         // );
//       },
//       gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 16 / 9,
//         // crossAxisSpacing: 10.0,
//         // mainAxisSpacing: 10.0,
//       ),
//     );
//   }),
// ),
