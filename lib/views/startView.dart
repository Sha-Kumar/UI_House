import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:UI_House/services/services.dart';
import 'package:UI_House/controllers/controllers.dart';

class StartView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 15.0,
        // bottom: PreferredSize(
        //   child: Container(
        //     // color: Colors.black,
        //     height: 1.0,
        //     decoration: BoxDecoration(
        //       color: Colors.black,
        //       boxShadow: <BoxShadow>[
        //         BoxShadow(
        //           color: Colors.black54,
        //           blurRadius: 15.0,
        //           offset: Offset(0, 1),
        //         ),
        //       ],
        //       // boxShadow:
        //     ),
        //   ),
        //   preferredSize: Size.fromHeight(4.0),
        // ),
        backgroundColor: Colors.transparent,
        titleSpacing: 70,
        title: const Text(
          'UI-HOUSE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            fontFamily: "Helvetica Neue",
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () {},
            child: const Text('About'),
          ),
          FlatButton(
            onPressed: () {},
            child: const Text('Upload'),
          ),
          FlatButton(
            onPressed: () {
              Get.dialog(
                AuthWidget2(
                  isSignUp: false,
                ),
              );
            },
            child: const Text('Sign In'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 35, 10),
            child: RaisedButton(
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                Get.dialog(
                  AuthWidget(),
                );
              },
              color: Colors.deepPurpleAccent,
              child: const Text(
                'Get Started',
                style:
                    TextStyle(color: Colors.white, fontFamily: "Lucida Sans"),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<User>(
          stream: FirebaseService().authChange,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Center(
                child: RaisedButton(
                  onPressed: () async {
                    await FirebaseService().signOut();
                  },
                  child: const Text('sign out'),
                ),
              );
            }
            return ListView(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 270,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: const Color(0xffe6e6e6),
                              margin: const EdgeInsets.only(left: 20.0),
                              padding: const EdgeInsets.all(7.0),
                              child: const Text(
                                "W",
                                style: TextStyle(
                                    fontFamily: "Times New Roman",
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Text('Hello'),
                                Text('Hello'),
                                Text('Hello'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Hello'),
                                Text('Hello'),
                                Text('Hello'),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "© 2020 A wizard Corporation",
                                style: TextStyle(
                                  color: Color(0xff707070),
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
                )
              ],
            );
          }),
    );
  }
}

class AuthWidget extends GetView<AuthController> {
  final service = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool isSignUp;
  AuthWidget({
    Key key,
    this.isSignUp = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Text(
                    isSignUp ? 'Sign up with email' : 'Welcome Back',
                    style: const TextStyle(
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
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.isEmpty ) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: TextFormField(
                      controller: controller.name,
                      decoration: InputDecoration(
                        labelText: "Enter User-Name",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.isEmpty ) {
                          return "Name cannot be empty";
                        } else {
                          return null;
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
                      controller: controller.pass,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "password cannot be empty";
                        } else {
                          return null;
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
                        isSignUp
                            ? await service.createUserWithEmailAndPassword(
                                controller.email.text, controller.pass.text)
                            : await service.signInWithEmailAndPassword(
                                controller.email.text, controller.pass.text);
                        if (Get.isDialogOpen) Get.back();
                      }
                    },
                    color: const Color(0xff4ba97d),
                    child: Text(
                      isSignUp ? 'Sign Up' : 'Sign In',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  if (isSignUp)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: Text(
                        "Click “Sign Up” to agree to UI-House's Terms of Service and acknowledge that UI-House's Privacy Policy applies to you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Helvetica Neue",
                          fontSize: 13,
                          color: Color(0xffb9b9b9),
                        ),
                      ),
                    )
                  else
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


class AuthWidget2 extends GetView<AuthController> {
  final service = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool isSignUp;
  AuthWidget2({
    Key key,
    this.isSignUp = true,
  }) : super(key: key);
  // final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Text(
                    isSignUp ? 'Sign up with email' : 'Welcome Back',
                    style: const TextStyle(
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
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.isEmpty ) {
                          return "Email cannot be empty";
                        } else {
                          return null;
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
                      controller: controller.pass,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "password cannot be empty";
                        } else {
                          return null;
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
                        isSignUp
                            ? await service.createUserWithEmailAndPassword(
                                controller.email.text, controller.pass.text)
                            : await service.signInWithEmailAndPassword(
                                controller.email.text, controller.pass.text);
                        if (Get.isDialogOpen) Get.back();
                      }
                    },
                    color: const Color(0xff4ba97d),
                    child: Text(
                      isSignUp ? 'Sign Up' : 'Sign In',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  if (isSignUp)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: Text(
                        "Click “Sign Up” to agree to UI-House's Terms of Service and acknowledge that UI-House's Privacy Policy applies to you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Helvetica Neue",
                          fontSize: 13,
                          color: Color(0xffb9b9b9),
                        ),
                      ),
                    )
                  else
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
