import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ResetPasswordController extends GetxController {
  var logger = Logger();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxBool isLoading = false.obs;
  final TextEditingController emailController = TextEditingController();

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: email);

      showSuccessPopup(
          'Success', 'Please check your email for the password reset link.');
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      if (e.code == 'user-not-found') {
        showErrorPopup('User not found',
            'The email address you entered is not registered.');
      } else if (e.code == 'invalid-email') {
        showErrorPopup(
            'Invalid email', 'The email address you entered is not valid.');
      } else {
        showErrorPopup('Error',
            'An error occurred while sending the password reset email. Please try again later.');
      }
      isLoading.value = false;
    } catch (e) {
      logger.e(e);

      showErrorPopup('Error',
          'An error occurred while sending the password reset email. Please check your internet connection and try again.');
      isLoading.value = false;
    }
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

  void showSuccessPopup(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  void showErrorPopup(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
