import 'package:firebase_auth/firebase_auth.dart';
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
  Future<void> _addUserToDB(UserCredential userCredential, String username) async {
    final CollectionReference userCollection = _firestore.collection('users');
    final user = UserModel(
      uid: userCredential.user.uid,
      email: userCredential.user.email,
      name : username
    );
    await userCollection.doc(userCredential.user.uid).set(user.toJson());
    // await _getUserFromDB(userCredential.user.uid);
  }

  Future<void> _getUserFromDB(String uid) async {
    final CollectionReference userCollection = _firestore.collection('users');
    final user = UserModel.fromJson(
      (await userCollection.doc(uid).get()).data(),
    );
    await LocalService.instance.save(user);
  }

  Future<void> createUserWithEmailAndPassword(String email, String pass) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String pass) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await LocalService.instance.clearLocalData();
      await _auth.signOut();
      // await Get.offNamedUntil(loginRoute, (route) => false);
    } catch (e) {
      Get.snackbar(
        'snack-5',
        'logout problem',
        duration: const Duration(milliseconds: 5),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
