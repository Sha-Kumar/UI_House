import 'package:UI_House/widgets/introFlagButton.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const BottomBar({
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
