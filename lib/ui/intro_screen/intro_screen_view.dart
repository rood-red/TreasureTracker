import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/ui/intro_screen/intro_screen_controller.dart';

class IntroScreen extends GetView<IntroScreenController> {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
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
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About TreasureTracker',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '     Introducing TreasureTracker, a sophisticated expense management solution meticulously designed to streamline your financial tracking endeavors. With TreasureTracker at your disposal, effortlessly monitor and control your weekly expenditures with precision and finesse. Experience the seamless integration of budget management tools tailored to optimize your financial efficiency, empowering you to cultivate prudent spending habits and maximize your savings potential.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 109),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: ElevatedButton(
                  onPressed: controller.navigateToLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
