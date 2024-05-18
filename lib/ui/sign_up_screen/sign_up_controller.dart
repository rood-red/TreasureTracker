import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:treasure_tracker/routes/app_pages.dart';

class SignUpController extends GetxController {
  var logger = Logger();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxBool isLoading = false.obs;

  SignUpController({String? email}) {
    if (email != null) {
      emailController.text = email;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateRetypePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please retype your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> signUpWithEmail() async {
    if (signUpFormKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        User? user = userCredential.user;

        if (user != null) {
          await FirebaseFirestore.instance
              .collection('user_details')
              .doc(user.uid)
              .set({
            'name': nameController.text,
            'emailAddress': emailController.text,
            'profileImage':
                'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg', // always default image
            'isActive': true,
          });

          isLoading.value = false;
          Get.rootDelegate.toNamed(AppRoutes.congatulations);
        }
      } on FirebaseAuthException catch (e) {
        logger.e('Error creating user: $e');
        switch (e.code) {
          case 'invalid-email':
            break;
          case 'weak-password':
            break;
        }
        isLoading.value = false;
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      isLoading.value = false;
      Get.snackbar('Error', 'Please fill in all required fields correctly',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
