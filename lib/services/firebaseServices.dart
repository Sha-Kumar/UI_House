import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:UI_House/models/models.dart';
import 'package:UI_House/constants/constants.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User> get authChange => _auth.authStateChanges();

  Future<void> uploadImageURLToCollection(String imgurl, String title) async {
    try {
      if (nameOfUser == '' || uidOfUser == '') {
        print('Error not signed-up');
        return;
      }
      // final UserModel userval = LocalService.instance.getUser();

      // print(userval.toJson().toString());

      // if (userval == null) {
      // print('Error not signed-up');
      // return;
      // }
      final String username = nameOfUser;
      final String uid = uidOfUser;

      // print(post.toJson().toString());
      final String url = photoCollection.doc().id;

      final post = Photo(
        photoId: url,
        title: title,
        uid: uid,
        likedUsers: [],
        username: username,
        likes: 0,
        photoUrl: imgurl,
        timeStamp: DateTime.now().microsecondsSinceEpoch.toString(),
      );

      await photoCollection.doc(url).set(post.toJson());

      await userCollection.doc(uid).update({
        'postphotos': FieldValue.arrayUnion([url]),
      });

      // await LocalService.instance.clearLocalData();

      // final UserModel uservalue =
      //     UserModel.fromJson((await userCollection.doc(uid).get()).data());
      // nameOfUser = userval.name;
      // uidOfUser = userval.uid;
      postsOfUser.add(url as dynamic);

      // await LocalService.instance.save(uservalue);
    } on Exception catch (e) {
      Get.snackbar(
        'Upload problem',
        'Not able to upload, try again later !!!\n${e.toString()}',
        duration: const Duration(
          seconds: 2,
        ),
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

//Add the user to DB
  Future<void> _addUserToDB(
      UserCredential userCredential, String username) async {
    final CollectionReference userCollection = _firestore.collection('users');
    final user = UserModel(
      uid: userCredential.user.uid,
      email: userCredential.user.email,
      name: username,
      userPhotoUrl: '',
      postphotos: [],
      bookmarks: [],
      likedPhotos: [],
    );

    await userCollection.doc(user.uid).set(user.toJson());
    final UserModel userval = UserModel.fromJson(
        (await userCollection.doc(userCredential.user.uid.toString()).get())
            .data());
    nameOfUser = userval.name;
    uidOfUser = userval.uid;
    likedPostsOfUser = userval.likedPhotos;
    savedPostsOfUser = userval.bookmarks;
    postsOfUser = userval.postphotos;
    photoOfUser = '';
    // print(nameOfUser);

    // await LocalService.instance.save(userval);
  }

  Future<bool> createUserWithEmailAndPassword(
      String email, String pass, String name) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      _addUserToDB(userCredential, name);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar(
          'WEAK PASSWORD',
          'The Password provided is too Weak !!!',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: const Duration(
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
          duration: const Duration(
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
          duration: const Duration(
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
        duration: const Duration(
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

      final UserModel user = UserModel.fromJson(
          (await userCollection.doc(userCredential.user.uid).get()).data());

      nameOfUser = user.name;
      uidOfUser = user.uid;
      likedPostsOfUser = user.likedPhotos;
      savedPostsOfUser = user.bookmarks;
      postsOfUser = user.postphotos;
      photoOfUser = user.userPhotoUrl;

      // await LocalService.instance.save(user);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar(
          'USER NOT FOUND',
          'No User found for that Email.',
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          duration: const Duration(
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
          duration: const Duration(
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
          duration: const Duration(
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
      uidOfUser = '';
      nameOfUser = '';
      likedPostsOfUser = [];
      savedPostsOfUser = [];
      // await LocalService.instance.clearLocalData();
      await _auth.signOut();
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
