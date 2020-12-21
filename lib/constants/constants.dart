import 'package:cloud_firestore/cloud_firestore.dart';

//ScreenRatio...
const double screenRatio = 754.4 / 1536;

//User value...
String nameOfUser = '';
String uidOfUser = '';
String photoOfUser = '';
List likedPostsOfUser = [];
List savedPostsOfUser = [];
List postsOfUser = [];

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
