import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/ui/sign_up_screen/sign_up_controller.dart';
import 'package:treasure_tracker/widgets/reusable_button.dart';
import 'package:treasure_tracker/widgets/reusable_textbox.dart';
import 'package:treasure_tracker/widgets/reusable_textbox_with_title.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Your Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 13),
                const Text(
                  'Fill out the form below to create your account. Once registered, you\'ll gain access to exclusive features, personalized recommendations, and seamless interactions.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 56),
                ReusableTextboxWithTitle(
                  title: 'Name',
                  textField: ReusableTextField(
                    controller: controller.nameController,
                    hintText: 'Enter your name',
                    validator: (value) => controller.validateName(value),
                  ),
                ),
                const SizedBox(height: 16),
                ReusableTextboxWithTitle(
                  title: 'Email',
                  textField: ReusableTextField(
                    controller: controller.emailController,
                    hintText: 'Enter your email',
                    validator: controller.validateEmail,
                  ),
                ),
                const SizedBox(height: 16),
                ReusableTextboxWithTitle(
                  title: 'Password',
                  textField: ReusableTextField(
                    controller: controller.passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    validator: (value) => controller.validatePassword(value),
                  ),
                ),
                const SizedBox(height: 16),
                ReusableTextboxWithTitle(
                  title: 'Retype Password',
                  textField: ReusableTextField(
                      controller: controller.retypePasswordController,
                      hintText: 'Retype your password',
                      obscureText: true,
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      validator: (value) => controller.validatePassword(value)),
                ),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  onPressed: controller.signUpWithEmail,
                  text: 'Sign Up',
                  isLoading: controller.isLoading,
                ),
                const SizedBox(height: 61),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: controller.signUpWithEmail,
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
