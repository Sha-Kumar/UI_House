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
    @required this.timeStamp,
    @required this.title,
  });

  String uid;
  String title;
  String photoUrl;
  String username;
  int likes;
  String timeStamp;
  List<dynamic> likedUsers;

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        uid: json["uid"] as String,
        photoUrl: json["photoUrl"] as String,
        username: json["username"] as String,
        likes: json["likes"] as int,
        likedUsers: json["likedUsers"] as List<dynamic>,
        timeStamp: json['timeStamp'] as String,
        title: json['title'] as String,
      );
  Map<String, dynamic> toJson() => {
        "username": username,
        "likes": likes,
        "likedUsers": likedUsers.cast<String>(),
        "uid": uid,
        "timeStamp": timeStamp,
        "photoUrl": photoUrl,
        "title": title,
      };
}
