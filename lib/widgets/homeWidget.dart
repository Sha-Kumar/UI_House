import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends GetView<HomeController> {
  final double screenWidth;
  final double screenHeight;
  const HomeWidget({
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                                      // AuthController.controller to = Get.find();
                                      if (AuthController
                                          .controller.isSigned.value) {
                                        final UploadController up =
                                            UploadController();
                                        await up.uploadImage();
                                      }
                                      // print(await up.uploadImage().toString());
                                      // controller.isSigned.value ? print('Hello') : print('Nooro');
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
          Container(
            width: screenWidth,
            height: screenHeight * 2.5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Hello'),
                      Text('hhh'),
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
                  //                 Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Image.asset('images/pic1.jpg'),
                  //     Image.asset('images/pic2.jpg'),
                  //     Image.asset('images/pic3.jpg'),
                  //   ],
                  // );
                ],
              ),
            ),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.blueAccent,
          ),
          const SizedBox(
            height: 20,
          ),
          BottomBar(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
        ],
      ),
    );
  }
}
