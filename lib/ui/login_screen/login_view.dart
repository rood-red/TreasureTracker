import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/widgets/reusable_button.dart';
import 'package:treasure_tracker/widgets/reusable_textbox.dart';
import 'package:treasure_tracker/widgets/reusable_textbox_with_title.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () {
              return Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 34),
                    ),
                    const SizedBox(height: 100),
                    ReusableTextboxWithTitle(
                      title: 'Email',
                      textField: ReusableTextField(
                        controller: controller.emailController,
                        hintText: 'email@domain.com',
                        validator: controller.validateEmail,
                      ),
                    ),
                    const SizedBox(height: 36.0),
                    ReusableTextboxWithTitle(
                      title: 'Password',
                      textField: ReusableTextField(
                          controller: controller.passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          validator: (value) =>
                              controller.validatePassword(value)),
                    ),
                    const SizedBox(height: 21.7),
                    controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : CustomElevatedButton(
                            onPressed: () {
                              controller.login(context);
                            },
                            text: 'Log in',
                            isLoading: controller.isLoading,
                          ),
                    const SizedBox(height: 61),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          children: [
                            const TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: controller.navigateToCreateAccount,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
