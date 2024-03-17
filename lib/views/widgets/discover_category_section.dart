import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/views/details/discver_categories_items.dart';

import 'categories_list_view.dart';
import 'custom_text.dart';

class DiscoverCategoriesSection extends StatelessWidget {
  const DiscoverCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: 'Discover Categories'.tr,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xffe8f9f1),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const DiscoverCategoriesItems());
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
        const CategoriesListView(),
      ],
    );
  }
}
