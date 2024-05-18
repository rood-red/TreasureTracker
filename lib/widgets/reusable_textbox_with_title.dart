import 'package:flutter/material.dart';

class ReusableTextboxWithTitle extends StatefulWidget {
  final String title;
  final Widget textField;
  final bool? withBiggerPaddingBottom;
  const ReusableTextboxWithTitle({
    super.key,
    required this.title,
    required this.textField,
    this.withBiggerPaddingBottom = false,
  });

  @override
  State<ReusableTextboxWithTitle> createState() =>
      _ReusableTextboxWithTitleState();
}

class _ReusableTextboxWithTitleState extends State<ReusableTextboxWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        widget.withBiggerPaddingBottom!
            ? const SizedBox(height: 40)
            : const SizedBox(height: 13),
        widget.textField,
        const SizedBox(height: 20),
      ],
    );
  }
}
