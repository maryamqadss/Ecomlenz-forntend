import 'package:berriesecomstore/controllers/login_screen_controller.dart';
import 'package:berriesecomstore/presentation/auth_screens/sign_up_screen.dart';
import 'package:berriesecomstore/presentation/auth_screens/widgets/auth_header.dart';
import 'package:berriesecomstore/presentation/auth_screens/widgets/auth_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_up_screen.dart';
import 'widgets/auth_button.dart';
import 'widgets/social_auth_button.dart';
import '../../style/style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const AuthHeader(title: "Sign In", subTitle: "Welcome back!"),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: loginController.formKey, // Assign the form key here
                      child: Column(
                        children: [
                          AuthTextInput(
                            controller: loginController.emailController,
                            hintText: 'Enter Email',
                            prefixIcon: Icons.email,
                            labelText: "Email Address",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AuthTextInput(
                            controller: loginController.passwordController,
                            hintText: 'Enter Password',
                            isPassword: true,
                            prefixIcon: Icons.lock,
                            labelText: "Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: secondary_Color,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: AuthButton(
                              onPressed: () {
                                if(loginController.formKey.currentState!.validate()){
                                  loginController.loginUser(email: loginController.emailController.text, password: loginController.passwordController.text);
                                }
                              },
                              title: "Sign In",
                            ),
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(color: Colors.grey),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Or',
                                style: TextStyle(
                                  color: primary_Color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Divider(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SocialAuthBtn(
                                imagePath: 'assets/images/google.png',
                                label: 'Google',
                              ),
                              SocialAuthBtn(
                                imagePath: 'assets/images/f.png',
                                label: 'Facebook',
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(color: primary_Color),
                              ),
                              InkWell(
                                onTap: () {
                                 Get.to(SignupScreen());
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: secondary_Color,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => Visibility(
                visible: loginController.isLoading.value,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primary_Color),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
