// import 'package:UI_House/views/views.dart';
// import 'package:UI_House/widgets/homeButton.dart';
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
      body: Container(
        alignment: Alignment.center,
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 5,
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  15,
                  5,
                  screenWidth - 150,
                  5,
                ),
                // alignment: Alignment,
                height: 30,
                width: 100,
                child: RaisedButton(
                  color: Colors.pinkAccent,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    width: screenWidth * 0.48,
                    height: screenHeight * 0.85,
                    child: ListView(
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: [
                          ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: Text(
                              'Uploading the Image',
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 2,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.justify,
                            ),
                            subtitle: Text(
                              'Enter the Upload button and select the image to upload.',
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        // color: Colors.pinkAccent,
                        border: Border.all(
                          color: Colors.pinkAccent,
                        )),
                    width: screenWidth * 0.48,
                    height: screenHeight * 0.85,
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.black38,
                        ),
                        Column(
                          children: [
                            const Spacer(),
                            const Text(
                              'Give your Feedback on the website',
                              style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 30,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: screenHeight * 0.3,
                                // child:
                                ),
                              ),
                              // child: TextFormField(

                              // keyboardType: TextInputType.multiline,
                              // textInputAction: TextInputAction.newline,
                              // minLines: 1,
                              // maxLines: 18,
                              //   controller:
                              //       HAndFController.hAndFController.desc,
                              //   decoration: InputDecoration(

                              //     contentPadding: new EdgeInsets.symmetric(
                              //         vertical: 25.0, horizontal: 10.0),
                              //     labelText: "Enter Feedback",
                              //     fillColor: Colors.white,
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(18.0),
                              //     ),
                              //     //fillColor: Colors.green
                              //   ),
                              //   validator: (val) {
                              //     if (val.isEmpty) {
                              //       return "Feedback cannot be empty"
                              //           .toString();
                              //     }
                              //     return '';
                              //   },
                              //   style: const TextStyle(
                              //     fontFamily: "Poppins",
                              //   ),
                              // ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
