import 'package:cloud_firestore/cloud_firestore.dart';

//ScreenRatio...
const double screenRatio = 754.4 / 1536;

//Userval...
String nameOfUser = '';
String uidOfUser = '';
List likedPostsOfUser = [];
List savedPostsOfUser = [];

// Firestore instance creation...
FirebaseFirestore _firestore = FirebaseFirestore.instance;

//firebase collections...
final CollectionReference photoCollection = _firestore.collection('photos');
final CollectionReference userCollection = _firestore.collection('users');

enum Type {
  loadPhotos,
  savedPhotos,
  likedPhots,
  shotPhotos,
}
