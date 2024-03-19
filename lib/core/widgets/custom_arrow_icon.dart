import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../views/widgets/custom_text.dart';

class CustomArrowItems extends StatelessWidget {
  const CustomArrowItems({
    super.key,
    required this.sectionName,
    this.onTap,
  });

  final String sectionName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: sectionName,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 40.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.sp),
              color: const Color(0xffe8f9f1),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward_sharp,
                color: Colors.green,
                size: 22.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
