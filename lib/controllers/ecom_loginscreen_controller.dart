import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';

import '../screens/home_screen.dart';


class LoginController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<Offset> positionAnimations;
  GlobalKey<FormState> formKey = GlobalKey();
  var obscureStatus = true.obs;
  var isLoading = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    positionAnimations = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
    super.onInit();
  }

  void toggleObscureStatus() {
    obscureStatus.value = !obscureStatus.value;
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void loginScreenToApp(
      String email, String password
      ) async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null) {
          Get.snackbar("Success", "Login successfully!");
          Get.offAllNamed(const HomeScreen() as String);
        }
      } catch (e) {
        Get.snackbar("Success", "Login failed");
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

