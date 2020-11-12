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
            height: 0.5,
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
