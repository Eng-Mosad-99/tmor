import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_text.dart';
import 'gift_and_packaging_list_view.dart';

class GiftAndPackagingSection extends StatelessWidget {
  const GiftAndPackagingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: 'Gift And Packaging'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20.sp,
              backgroundColor: const Color(0xffe8f9f1),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
         SizedBox(
          height: 10.h,
        ),
        const GiftAndPackagingListView(),
      ],
    );
  }
}
