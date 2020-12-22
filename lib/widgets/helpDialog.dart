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
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      desc,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Times New Roman",
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      style: TextStyle(color: Colors.white),
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
