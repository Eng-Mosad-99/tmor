import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/views/search_view.dart';

import 'custom_text.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SearchView());
      },
      child: Container(
        height: 50.h,
        padding:  EdgeInsets.symmetric(horizontal: 15.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.sp,
          ),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              size: 28,
            ),
             SizedBox(
              width: 10.w,
            ),
            CustomText(
              text: 'Search product'.tr,
              fontSize: 16.sp,
              color: const Color(0xff929292),
            ),
          ],
        ),
      ),
    );
  }
}
