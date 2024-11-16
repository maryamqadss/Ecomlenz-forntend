import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String id;
  late final String userName;
  late final String phoneNumber;
  late final String email;

  UserModel(
      {required this.id,
        required this.userName,
        required this.email,
        required this.phoneNumber});

  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot["id"];
    userName = documentSnapshot["userName"];
    phoneNumber = documentSnapshot["phoneNumber"];
    email = documentSnapshot["email"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["id"] = id;
    data["userName"] = userName;
    data["phoneNumber"] = phoneNumber;
    data["email"] = email;

    return data;
  }
}