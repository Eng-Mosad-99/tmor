import 'package:flutter/material.dart';
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
              fontSize: 16,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20,
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
        const SizedBox(
          height: 10,
        ),
        const MostViewedItemListView(),
      ],
    );
  }
}
