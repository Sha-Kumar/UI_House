import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:UI_House/models/models.dart';
import 'package:UI_House/services/services.dart';
// import '../routes.dart';

class FirebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User get currentUser => _auth.currentUser;
  Stream<User> get authChange => _auth.authStateChanges();

//Add the user to DB
  Future<void> _addUserToDB(
      UserCredential userCredential, String username) async {
    final CollectionReference userCollection = _firestore.collection('users');
    final user = UserModel(
      uid: userCredential.user.uid,
      email: userCredential.user.email,
      name: username,
    );
    await userCollection.doc(userCredential.user.uid).set(user.toJson());
    await getUserFromDB(userCredential.user.uid);
  }

  Future<void> getUserFromDB(String uid) async {
    final CollectionReference userCollection = _firestore.collection('users');
    final user = UserModel.fromJson(
      (await userCollection.doc(uid).get()).data(),
    );
    await LocalService.instance.save(user);
  }

  Future<bool> createUserWithEmailAndPassword(
      String email, String pass, String name) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      _addUserToDB(userCredential, name);
      // print(userCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar(
          'WEAK PASSWORD',
          'The Password provided is too Weak !!!',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: Duration(
            seconds: 2,
          ),
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
          'EMAIL-ID ALREADY IN USE',
          'The Account already exists for that Email.',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: Duration(
            seconds: 2,
          ),
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'ERROR',
          'Something Went Wrong. Try again Later !!!',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: Duration(
            seconds: 2,
          ),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        'ERROR',
        e.message.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        duration: Duration(
          seconds: 2,
        ),
        snackPosition: SnackPosition.TOP,
      );
    }
    return false;
  }

  Future<bool> signInWithEmailAndPassword(String email, String pass) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      print(userCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar(
          'USER NOT FOUND',
          'No User found for that Email.',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: Duration(
            seconds: 2,
          ),
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar(
          'WRONG PASSWORD',
          'Wrong Password provided for that User.',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: Duration(
            seconds: 2,
          ),
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          e.message.toString(),
          'Something Went Wrong. Try again !!!',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: Duration(
            seconds: 2,
          ),
          snackPosition: SnackPosition.TOP,
        );
      }
    }
    return false;
  }

  Future<void> signOut() async {
    try {
      await LocalService.instance.clearLocalData();
      await _auth.signOut();
      // await Get.offNamedUntil(loginRoute, (route) => false);
    } catch (e) {
      Get.snackbar(
        'PROBLEM IN LOGOUT',
        'Not able to logout, try again later !!!',
        duration: const Duration(
          seconds: 2,
        ),
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
