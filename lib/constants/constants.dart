import 'package:cloud_firestore/cloud_firestore.dart';

// Firestore instance creation...
FirebaseFirestore _firestore = FirebaseFirestore.instance;

//firebase collections...
final CollectionReference postCollection = _firestore.collection('photos');
final CollectionReference userCollection = _firestore.collection('users');

enum Type {
  loadPhotos,
}
