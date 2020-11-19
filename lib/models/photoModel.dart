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
    @required this.photo,
    @required this.username,
    @required this.likes,
    @required this.likedUsers,
    @required this.timeStamp,
  });

  String uid;
  List<int> photo;
  String username;
  int likes;
  String timeStamp;
  List<String> likedUsers = [];

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        uid: json["uid"] as String,
        photo: json["photoUrl"] as List<int>,
        username: json["username"] as String,
        likes: json["likes"] as int,
        likedUsers: json["likedUsers"] as List<String>,
        timeStamp: json['timeStamp'] as String,
      );
  Map<String, dynamic> toJson() => {
        "username": username,
        "likes": likes,
        "likedUsers": likedUsers,
        "uid": uid,
        "timeStamp": timeStamp,
        "photo": photo,
      };
}
