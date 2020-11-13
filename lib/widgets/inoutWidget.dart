import 'package:UI_House/controllers/controllers.dart';
import 'package:UI_House/services/services.dart';
import 'package:UI_House/views/views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InOutWidget extends GetView<AuthController> {
  const InOutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseService().authChange,
      builder: (context, snapshot) {
        return FlatButton(
          child: Text(
            controller.isSigned.value ? 'SignOut' : 'SignIn',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            controller.isSigned.value
                ? await FirebaseService().signOut()
                : Get.dialog(
                    SigninView(),
                  );
            if (controller.isSigned.value) controller.isSigned.value = false;
          },
        );
      },
    );
  }
}
