import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController? controller;
  Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  String? hintText;
  String? Function(String?)? validator;
  CustomTextfield({
    super.key,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Color(0xFFF5F5F5),
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
