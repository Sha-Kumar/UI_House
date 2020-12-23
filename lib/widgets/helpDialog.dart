import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:UI_House/controllers/controllers.dart';

class HelpDialog extends GetView<HAndFController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String heading;
  final String desc;
  HelpDialog({
    @required this.heading,
    @required this.desc,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Center(
        child: SizedBox(
          width: 750,
          child: Material(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    heading,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: "Times New Roman",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 10,
                    ),
                    child: Container(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Container(
                      height: 275,
                      width: 625,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        border: Border.all(
                          color: Colors.redAccent,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                          bottom: 25,
                          right: 25,
                          left: 25,
                        ),
                        child: Text(
                          desc,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Times New Roman",
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 10,
                    ),
                    child: Container(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (Get.isDialogOpen) {
                          Get.back();
                        }
                      }
                    },
                    color: Colors.blueAccent,
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox.shrink(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
