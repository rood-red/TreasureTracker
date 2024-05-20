import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/ui/create_account/create_account_controller.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Form(
          key: controller.loginFormKey,
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(52.0),
                child: Obx(
                  () {
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            !kIsWeb
                                ? Image.asset(
                                    '/png/treasure_tracker.png',
                                    height: 316,
                                    width: 430,
                                  )
                                : Image.asset(
                                    'assets/png/treasure_tracker.png',
                                    height: 316,
                                    width: 430,
                                  ),
                            const Positioned(
                              bottom: 50,
                              child: Text(
                                'Create an account',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 25,
                              child: Text(
                                'Enter your email to sign up for this app',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.loginEmailController,
                          validator: controller.validateEmail,
                          decoration: const InputDecoration(
                            hintText: 'email@domain.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: controller.validateAccount,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 60),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('Sign up with email'),
                              ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: controller.navigateToForgorPassword,
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Divider(
                                  color: Colors.grey,
                                  height: 36,
                                ),
                              ),
                            ),
                            const Text(
                              'or continue with',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Divider(
                                  color: Colors.grey,
                                  height: 36,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xffeeeeee),
                            backgroundColor: Colors.grey,
                            minimumSize: const Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: controller.signUpWithGoogle,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/png/google.png',
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            children: [
                              TextSpan(
                                  text:
                                      'By clicking continue, you agree to our'),
                              TextSpan(
                                text: 'Terms of Service\n',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
