import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final RxBool isLoading;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 308,
        child: Obx(
          () => ElevatedButton(
            onPressed: isLoading.value ? null : onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xffD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.0),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            child: isLoading.value
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
