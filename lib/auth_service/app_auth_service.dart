import 'package:berriesecomstore/presentation/auth_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/my_toast.dart';

class AppAuthService{
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> signUpUserToApp(String userEmail,String userPassword)async{
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return userCredential.user;
    } on FirebaseAuthException catch (a){
      if(a.code == "email-already-in-use"){
        showToast(message: "Email already in use");
      }
      if(a.code == "weak-password"){
        showToast(message: "Kindly use strong password");
      }
    } catch (e) {
      print("Exception Occurred------------->:$e");
      showToast(message: "Something went wrong!");
      return null;
    }
    return null;
  }

  static Future<User?> loginUserToApp(String userEmail,String userPassword)async{
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return userCredential.user;
    } on FirebaseAuthException catch (a){
      if(a.code == "operation-not-allowed"){
        showToast(message: "Can't login: Contact Administration");
      }
      if(a.code == "weak-password"){
        showToast(message: "Kindly use strong password");
      }
    } catch (e) {
      print("Exception Occurred------------->:$e");
      showToast(message: "Something went wrong!");
      return null;
    }
    return null;
  }

  static Future<void> logout(BuildContext context)async{
    try{
      await auth.signOut();
      showToast(message: "Sign out successful");
      Get.offAll(()=>LoginScreen());
    } catch(e){
      showToast(message: "Unable to log out");
    }
  }
}