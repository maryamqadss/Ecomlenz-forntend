import 'package:berriesecomstore/presentation/auth_screens/login_screen.dart';
import 'package:berriesecomstore/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth  = FirebaseAuth.instance;
  static late final Rx<User?> firebaseUser;


  @override
  void onReady() {
    super.onReady();
    firebaseUser = _auth.currentUser.obs;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

  }

  _setInitialScreen(User? user){
    user == null
        ? Get.offAll(()=>LoginScreen())
        : Get.offAll(DashboardScreen());
  }
}