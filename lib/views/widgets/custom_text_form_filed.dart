import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hntText,
    this.keyboardType,
    this.onSaved,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  Widget? prefixIcon;
  Widget? suffixIcon;
  final String hntText;
  TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hntText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: buildBorder(),
        focusedBorder: buildBorder(
          Colors.black,
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      10.sp,
    ),
  );
}
