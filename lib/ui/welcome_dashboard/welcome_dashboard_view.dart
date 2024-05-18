import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/ui/welcome_dashboard/welcome_controller.dart';
import 'package:treasure_tracker/widgets/reusable_textbox.dart';
import 'package:treasure_tracker/widgets/reusable_textbox_with_title.dart';

class WelcomeDashboardView extends GetView<WelcomeDashboardController> {
  const WelcomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDAFBE0),
        leadingWidth: 250,
        leading: !kIsWeb
            ? Image.asset(
                '/png/treasure_tracker.png',
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/png/treasure_tracker.png',
                fit: BoxFit.cover,
              ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(27.0),
              child: Text(
                'Welcome User!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: ReusableTextboxWithTitle(
                title: 'Monthly Budget',
                withBiggerPaddingBottom: true,
                textField: ReusableTextField(
                  controller: controller.monthlyBudgetController,
                  hintText: 'P 0.00',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(55.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
