import 'package:berriesecomstore/controllers/sign_up_screen_controller.dart';
import 'package:berriesecomstore/presentation/auth_screens/login_screen.dart';
import 'package:berriesecomstore/presentation/auth_screens/widgets/auth_button.dart';
import 'package:berriesecomstore/presentation/auth_screens/widgets/auth_header.dart';
import 'package:berriesecomstore/presentation/auth_screens/widgets/auth_text_input.dart';
import 'package:berriesecomstore/presentation/auth_screens/widgets/social_auth_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/style.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              AuthHeader(title: "Sign Up", subTitle: "Create Account"),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: signUpController.formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AuthTextInput(
                                controller:
                                    signUpController.firstNameController,
                                hintText: 'Enter First Name',
                                prefixIcon: Icons.person,
                                labelText: "First Name",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: AuthTextInput(
                                controller: signUpController.lastNameController,
                                hintText: 'Enter Last Name',
                                prefixIcon: Icons.person,
                                labelText: "Last Name",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        AuthTextInput(
                          controller: signUpController.emailController,
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
                          controller: signUpController.phoneController,
                          hintText: 'Enter Phone Number',
                          prefixIcon: Icons.phone,
                          labelText: "Phone Number",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        AuthTextInput(
                          controller: signUpController.passwordController,
                          hintText: 'Enter Password',
                          isPassword: true,
                          prefixIcon: Icons.lock,
                          labelText: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        AuthTextInput(
                          controller:
                              signUpController.confirmPasswordController,
                          hintText: 'Confirm Password',
                          isPassword: true,
                          prefixIcon: Icons.lock,
                          labelText: "Confirm Password",
                          validator: (value) {
                            if (value !=
                                signUpController.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'By signing up you agree to the ',
                                style: TextStyle(color: Colors.black87),
                              ),
                              TextSpan(
                                text: 'Terms of Service and Privacy Policy',
                                style: const TextStyle(
                                  color: secondary_Color,
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Terms tapped');
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: AuthButton(
                            onPressed: () {
                              if(signUpController.formKey.currentState!.validate()){
                                signUpController.signUp(
                                    firstName: signUpController.firstNameController.text,
                                    lastName: signUpController.lastNameController.text,
                                    phone: signUpController.phoneController.text,
                                    email: signUpController.emailController.text,
                                    password: signUpController.passwordController.text);
                              }
                            },
                            title: "Sign Up",
                          ),
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(child: Divider(color: Colors.grey)),
                            const SizedBox(width: 8),
                            const Text(
                              'Or',
                              style: TextStyle(
                                color: primary_Color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(child: Divider(color: Colors.grey)),
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
                              'Already have an account? ',
                              style: TextStyle(color: primary_Color),
                            ),
                            InkWell(
                              onTap: () {
                               Get.to(LoginScreen());
                              },
                              child: const Text(
                                'Sign In',
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
            ],
          ),
          Obx(
            () => Visibility(
              visible: signUpController.isLoading.value,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primary_Color),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
