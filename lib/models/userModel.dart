import 'package:meta/meta.dart';

class UserModel {
  UserModel({
    @required this.name,
    @required this.email,
    @required this.uid,
    this.postphotos,
    this.bookmarks,
  });

  String name;
  String email;
  String uid;
  List<dynamic> postphotos;
  List<dynamic> bookmarks;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? null : json["name"] as String,
        email: json["email"] == null ? null : json["email"] as String,
        uid: json["uid"] == null ? null : json["uid"] as String,
        postphotos: json["postphotos"] as List<dynamic>,
        bookmarks: json["postphotos"] as List<dynamic>,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
        "postphotos": postphotos.cast<String>(),
        "bookmarks":bookmarks.cast<String>(),
      };
}
