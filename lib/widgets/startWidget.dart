import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/views/views.dart';
import 'package:UI_House/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartWidget extends GetView<AuthController> {
  final double screenWidth;
  final double screenHeight;
  const StartWidget({
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Container(
            height: screenHeight * (550 / 754.4),
            width: screenWidth,
            alignment: Alignment.center,
            color: const Color.fromRGBO(0, 0, 1, 0.02),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: screenWidth / 2 - 10,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all((screenHeight * 75) / 550),
                      child: Column(
                        children: [
                          const Text(
                            "Discover the world’s top designers & creatives.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 41,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lucida Sans",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "UI-House is the leading destination to find & showcase creative work and home to that of world's best design professionals.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lucida Sans",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
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
                              shape: const RoundedRectangleBorder(
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
