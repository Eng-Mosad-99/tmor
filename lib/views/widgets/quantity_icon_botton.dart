import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityIconBotton extends StatelessWidget {
  const QuantityIconBotton({
    super.key,
    required this.icon,
  });

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffcee3da),
        ),
        borderRadius: BorderRadius.circular(10.sp),
        color: Colors.transparent,
      ),
      child: Icon(
        icon,
        size: 25.sp,
      ),
    );
  }
}
