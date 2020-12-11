import 'package:meta/meta.dart';

class UserModel {
  UserModel({
    @required this.name,
    @required this.email,
    @required this.uid,
    this.postphotos,
    this.bookmarks,
    this.likedPhotos,
    this.userPhotoUrl,
  });

  String name;
  String email;
  String uid;
  String userPhotoUrl;
  List<dynamic> postphotos;
  List<dynamic> bookmarks;
  List<dynamic> likedPhotos;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? null : json["name"] as String,
        email: json["email"] == null ? null : json["email"] as String,
        uid: json["uid"] == null ? null : json["uid"] as String,
        postphotos: json["postphotos"] as List<dynamic>,
        bookmarks: json["bookmarks"] as List<dynamic>,
        likedPhotos: json["likedPhotos"] as List<dynamic>,
        userPhotoUrl: json["userPhotoUrl"] == null
            ? null
            : json["userPhotoUrl"] as String,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
        "userPhotoUrl": userPhotoUrl,
        "postphotos": postphotos.cast<String>(),
        "bookmarks": bookmarks.cast<String>(),
        "likedPhotos": likedPhotos.cast<String>(),
      };
}
