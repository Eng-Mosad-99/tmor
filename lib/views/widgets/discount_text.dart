import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiscountText extends StatelessWidget {
  const DiscountText({super.key, required this.discountText});
  final String discountText;
  @override
  Widget build(BuildContext context) {
    return Text(
      discountText.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: 14.sp,
      ),
    );
  }
}
