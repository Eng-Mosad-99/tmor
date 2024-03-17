import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/views/details/feature_items_details.dart';

import 'custom_text.dart';
import 'featured_product_list_view.dart';

class FeatureItemsSection extends StatelessWidget {
  const FeatureItemsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: 'FEATURED ITEMS'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xffe8f9f1),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const FeatureItemDetails());
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
        const FeaturedListView(),
      ],
    );
  }
}
