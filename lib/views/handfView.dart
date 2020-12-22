// import 'package:UI_House/views/views.dart';
// import 'package:UI_House/widgets/homeButton.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:UI_House/controllers/controllers.dart';

class HAndFView extends GetView<HAndFController> {
  const HAndFView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: screenWidth,
            height: screenHeight * 2,
            child: Column(
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                          bottom: 45,
                          left: 5,
                        ),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(
                            15,
                            5,
                            15,
                            5,
                          ),
                          width: 100,
                          height: 50,
                          child: RaisedButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            color: Colors.white,
                            hoverColor: Colors.pinkAccent,
                            onPressed: () {
                              Get.back();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          'UI HOUSE (A Developer site for Development)-Help Page',
                          style: TextStyle(
                            fontSize: 43,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                          bottom: 45,
                          right: 5,
                        ),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(
                            15,
                            5,
                            15,
                            5,
                          ),
                          height: 50,
                          width: 160,
                          child: RaisedButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            color: Colors.white,
                            hoverColor: Colors.pinkAccent,
                            onPressed: () {
                              //Yet to produce...
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'New Request',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: screenHeight * 1.25,
                    width: screenWidth * 0.8,
                    child: Center(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Account & Preferences',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 75.0,
                              vertical: 10,
                            ),
                            child: Container(
                              height: 1.0,
                              width: screenWidth * 0.75,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Getting Started',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Account Settings',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 530,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Profile Update',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Signin',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 538,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Delete Account',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Signout',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 523,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Block Account',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Home Page Preferences',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 75.0,
                              vertical: 10,
                            ),
                            child: Container(
                              height: 1.0,
                              width: screenWidth * 0.75,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'User Views',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Designs/Images',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Search-Bar',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 493,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Upload Newone',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Filtration',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 513,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Edit Design',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Refresh Designs',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 446,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Delete Design',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Like and Save',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Issues',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 75.0,
                              vertical: 10,
                            ),
                            child: Container(
                              height: 1.0,
                              width: screenWidth * 0.75,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Signin/Login',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Signout/Logout',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 240,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Upload',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 270,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Refresh',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  'Filtration',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 75,
                          ),
                          Container(
                            height: 195,
                            width: 775,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blueGrey,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 45,
                                    ),
                                    child: Text(
                                      // ignore: avoid_escaping_inner_quotes
                                      'Can\'t find what you\'re looking for?',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: RaisedButton(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      color: Colors.white,
                                      hoverColor: Colors.pinkAccent,
                                      onPressed: () {
                                        // Get.back();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'New Request',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 21,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                ),
                Container(
                  // height: screenHeight * 0.3,
                  width: screenWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
