import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/ui/reset_password_screen/reset_password_controller.dart';
import 'package:treasure_tracker/widgets/reusable_textbox.dart';
import 'package:treasure_tracker/widgets/reusable_textbox_with_title.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 34),
                  ),
                  const SizedBox(height: 200),
                  ReusableTextboxWithTitle(
                    title: 'Email',
                    textField: ReusableTextField(
                      controller: controller.emailController,
                      hintText: 'youremail@example.com',
                      validator: controller.validateEmail,
                    ),
                  ),
                  const SizedBox(height: 200.0),
                  controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.sendResetPasswordEmail(
                                controller.emailController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Send email'),
                        ),
                ],
              );
            },
          )),
    );
  }
}
