import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? suffixIcon;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const ReusableTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.obscureText,
  }) : super(key: key);

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  bool _isPressed = false;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: widget.hintText,
        iconColor: Colors.grey,
        suffixIcon: SizedBox(
          height: 10,
          width: 10,
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTapDown: (_) {
              setState(() {
                _obscureText = false;
                _isPressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                _obscureText = true;
                _isPressed = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _obscureText = true;
                _isPressed = false;
              });
            },
            child: Icon(
              widget.suffixIcon?.icon,
              color: _isPressed ? Colors.green : Colors.grey,
            ),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      validator: widget.validator,
    );
  }
}
