// import 'package:UI_House/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:UI_House/services/services.dart';
import 'package:UI_House/controllers/controllers.dart';

class SigninView extends GetView<AuthController> {
  final service = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SigninView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: Center(
          child: SizedBox(
            width: 500,
            child: Material(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      'Login With Email',
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontSize: 28,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21.0),
                          ),
                          prefixIcon: const Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.email,
                              color: Colors.lime,
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Email cannot be empty";
                          } else {
                            return GetUtils.isEmail(val)
                                ? null
                                : "don't you have patience to enter proper email";
                          }
                        },
                        style: const TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: TextFormField(
                        obscureText: controller.isPassVisible.value,
                        controller: controller.pass,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21.0),
                          ),
                          prefixIcon: const Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.lock,
                              color: Colors.lime,
                            ),
                          ),
                          suffixIcon: Material(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            child: Obx(
                              () => IconButton(
                                color: Colors.lime,
                                icon: Icon(
                                  controller.isPassVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  controller.isPassVisible.toggle();
                                },
                              ),
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "password cannot be empty";
                          } else {
                            return GetUtils.isLengthGreaterOrEqual(val, 8)
                                ? null
                                : "can't you enter a proper password";
                          }
                        },
                        style: const TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (await service.signInWithEmailAndPassword(
                              controller.email.text, controller.pass.text)) {
                            controller.isSigned.value = true;
                          }

                          if (Get.isDialogOpen) {
                            controller.email.clear();
                            controller.pass.clear();
                            Get.back();
                          }
                          // if(controller.isSigned.value)
                          // Get.toNamed(homeroute);
                        }
                      },
                      color: Colors.blueAccent,
                      child: const Text(
                        'Sign In',
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
      ),
    );
  }
}
