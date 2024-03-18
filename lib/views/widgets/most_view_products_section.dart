import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../details/most_viewed_products_details.dart';
import 'custom_text.dart';
import 'most_viewed_list_view.dart';

class MostViewsProductsSection extends StatelessWidget {
  const MostViewsProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: 'Most Viewed ITEMS'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20.sp,
              backgroundColor: const Color(0xffe8f9f1),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const MostViewedProductsDetails());
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
          height: 10.h,
        ),
        const MostViewedItemListView(),
      ],
    );
  }
}
