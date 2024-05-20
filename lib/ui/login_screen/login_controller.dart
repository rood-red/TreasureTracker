// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:treasure_tracker/routes/app_pages.dart';
import 'package:treasure_tracker/services/api/fetch_firebase.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  var logger = Logger();

  final FirestoreService _firestoreService = Get.find<FirestoreService>();

  void navigateToCreateAccount() {
    Get.rootDelegate.toNamed(AppRoutes.signup);
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;

        bool success = await _firestoreService.firebaseLogin(
          emailController.text,
          passwordController.text,
        );

        isLoading.value = false;

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Successful'),
              backgroundColor: Colors.green,
            ),
          );
          Get.rootDelegate.toNamed(AppRoutes.welcome);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Please check your email or password and try again'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (error) {
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
