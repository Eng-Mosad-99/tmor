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
            CircleAvatar(
              radius: 20.sp,
              backgroundColor: const Color(0xffe8f9f1),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const LatestItemDetails());
                },
                icon: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.green,
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
