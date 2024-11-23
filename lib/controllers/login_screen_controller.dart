import 'package:berriesecomstore/auth_service/app_auth_service.dart';
import 'package:berriesecomstore/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final isLoading = false.obs;

  void clearControllers(){
    emailController.clear();
    passwordController.clear();
  }

  void loginUser({
    required String email,
    required String password})async{
    isLoading.value = true;
    clearControllers();
    User? user = await AppAuthService.loginUserToApp(email, password);
    if(user != null){
      isLoading.value = false;
      Get.snackbar("Success", "You have been logged in successfully");
      Get.offAll(()=> DashboardScreen());
    } else {
      isLoading.value = false;
      Get.snackbar("Login Failed", "Unable to sign you in");
    }
  }


}