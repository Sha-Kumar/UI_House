import 'package:meta/meta.dart';

class UserModel {
  UserModel({@required this.name, @required this.email, @required this.uid});

  String name;
  String email;
  String uid;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? null : json["name"] as String,
        email: json["email"] == null ? null : json["email"] as String,
        uid: json["uid"] == null ? null : json["uid"] as String,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
      };
}
