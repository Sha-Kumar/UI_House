import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PhotoModel {
  List<Photo> photos;
  PhotoModel({
    this.photos,
  });

  PhotoModel.fromDocumentSnapshot(List<DocumentSnapshot> json) {
    if (json != null) {
      photos = <Photo>[];
      // ignore: avoid_function_literals_in_foreach_calls
      json.forEach((element) {
        photos.add(Photo.fromMap(element.data()));
      });
    }
  }
}

class Photo {
  Photo({
    @required this.uid,
    @required this.photoUrl,
    @required this.username,
    @required this.likes,
    @required this.likedUsers,
  });

  String uid;
  String photoUrl;
  String username;
  int likes;
  List<String> likedUsers = [];

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        uid: json["uid"] as String,
        photoUrl: json["photoUrl"] as String,
        username: json["username"] as String,
        likes: json["likes"] as int,
        likedUsers: json["translation"] as List<String>,
      );
}
