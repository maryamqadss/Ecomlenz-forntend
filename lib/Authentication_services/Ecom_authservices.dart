import 'package:firebase_auth/firebase_auth.dart';

import '../screens/Ecom_toast_message.dart';

class FirebaseAuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Future<User?> signUPScreenToApp(String userEmail, String userPassword) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return credential.user;
    } on FirebaseAuthException catch (a) {
      if (a.code == "email-already  use in ") {}
    } catch (e) {
      print("Some Error Accoured  :$e");
    }
  }

  Future<User?> loginScreenToApp(String userEmail, String userPassword) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return credential.user;
    } catch (e) {
      print("Some Error Accoured  :$e");
      showTostmsg(message: "Something went gone");
    }
  }

  static Future<void> logout() async {
    try {
      await auth.signOut();
      showTostmsg(message: "Logout successfully");
    } catch (e) {
      showTostmsg(message: "unable to Logout");
    }
  }
}
