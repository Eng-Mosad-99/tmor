import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../details/latest_item_details.dart';
import 'custom_text.dart';
import 'latest_item_list_view.dart';

class LatestItemsSection extends StatelessWidget {
  const LatestItemsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: 'Latest ITEMS'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => const LatestItemDetails());
              },
              child: Container(
                width: 40.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  color: const Color(0xffe8f9f1),
                ),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.green,
                  size: 22.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.sp,
        ),
        const LatestItemListView(),
      ],
    );
  }
}
