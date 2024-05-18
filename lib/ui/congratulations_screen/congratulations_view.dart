import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/ui/congratulations_screen/congratulations_controller.dart';
import 'package:treasure_tracker/widgets/reusable_button.dart';

class CongratulationsScreen extends GetView<CongratulationsController> {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 252,
              height: 252,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 200,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'CONGRATULATIONS!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'You have successfully created an account!',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 57),
            CustomElevatedButton(
              onPressed: controller.navigateToNextScreen,
              text: 'Continue',
              isLoading: controller.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
