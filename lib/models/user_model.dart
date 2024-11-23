import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String phoneNumber;
  late final String email;

  UserModel({required this.id, required this.firstName,required this.lastName,required this.email,required this.phoneNumber});


  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    id = documentSnapshot["id"];
    firstName = documentSnapshot["firstName"];
    lastName = documentSnapshot["lastName"];
    phoneNumber = documentSnapshot["phoneNumber"];
    email = documentSnapshot["email"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};
    data["id"] = id;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["phoneNumber"] = phoneNumber;
    data["email"] = email;
    return data;
  }
}