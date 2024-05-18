import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:treasure_tracker/routes/app_pages.dart';
import 'package:treasure_tracker/services/api/fetch_firebase.dart';
import 'package:treasure_tracker/services/models/user_details_model.dart';

class LoginController extends GetxController {
  final FirestoreService _firestoreService = Get.find<FirestoreService>();

  final loginFormKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;

  TextEditingController? loginEmailController;

  var logger = Logger();

  @override
  void onInit() {
    super.onInit();
    loginEmailController = TextEditingController();
  }

  @override
  void onClose() {
    loginEmailController?.dispose();
    super.onClose();
  }

  void navigateToForgorPassword() {
    Get.rootDelegate.toNamed(AppRoutes.forgotPassword);
  }

  Future<void> validateAccount() async {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

      final email = loginEmailController?.text ?? '';

      try {
        var query = await _firestoreService.fetchUsers();
        List<UserDetails> users =
            query.where((user) => user.emailAddress == email).toList();

        if (users.isNotEmpty) {
          isLoading.value = false;

          Get.rootDelegate.toNamed(AppRoutes.welcome);
        } else {
          isLoading.value = false;
          Get.rootDelegate.toNamed(AppRoutes.signup,
              arguments: {'email': loginEmailController!.text});
        }
      } catch (e) {
        isLoading.value = false;

        logger.e('Error checking email existence: $e');
      }
    } else {
      isLoading.value = false;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> signUpWithGoogle() async {
    var userCreds = await signInWithGoogle();

    logger.d(userCreds);
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            '3635716350-31bhbao8gi1st7vv0r25mtiri8mdi71s.apps.googleusercontent.com',
        scopes: [
          'email',
        ],
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        String? name = user.displayName;
        String? email = user.email;
        String? photoUrl = user.photoURL;

        await FirebaseFirestore.instance
            .collection('user_details')
            .doc(user.uid)
            .set({
          'name': name,
          'emailAddress': email,
          'profileImage': photoUrl,
          'isActive': true,
        });
      }

      return userCredential;
    } on Exception catch (e) {
      logger.e('exception->$e');
      return null;
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
