import 'package:cloud_firestore/cloud_firestore.dart';

//firebase collections
final photosCollection = FirebaseFirestore.instance.collection('photos');

enum Type {
  loadPhotos,
}
