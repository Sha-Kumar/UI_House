import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/widgets/bottomBar.dart';
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
          Container(
            width: screenWidth,
            height: screenHeight * (550 / 754.4) + 50,
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1.0,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Welcome back 👋 to the Profile and contribute for designs and creativity !👋👋👋',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: RaisedButton(
                                    padding: const EdgeInsets.all(18.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                    ),
                                    onPressed: () {},
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
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: RaisedButton(
                                    padding: const EdgeInsets.all(18.0),
                                    shape: RoundedRectangleBorder(
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
                            SizedBox(
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
          Container(
            width: screenWidth,
            height: screenHeight * (700 / 754.4),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [],
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
          Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.blueAccent,
          ),
          SizedBox(
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
