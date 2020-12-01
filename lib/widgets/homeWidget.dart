import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/models/models.dart';
import 'package:UI_House/views/views.dart';
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                //                 Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Image.asset('images/pic1.jpg'),
                //     Image.asset('images/pic2.jpg'),
                //     Image.asset('images/pic3.jpg'),
                //   ],
                // );

                // FutureBuilder<List<Photo>>(
                //   future: ,
                //   builder: (context, snapshot) {
                //     return snapshot.hasData
                //         ? null
                //         : const Center(
                //             child: CircularProgressIndicator(),
                //           );
                //   },
                // ),

                Obx(() {
                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    controller: HomeController.hcontroller.homecontroller,
                    itemCount: HomeController.hcontroller.photos.length,
                    itemBuilder: (context, index) {
                      return null;
                    },
                    gridDelegate: null,
                  );
                }),
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
    );
  }
}
