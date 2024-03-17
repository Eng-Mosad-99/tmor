import 'package:flutter/material.dart';
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
              fontSize: 16,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20,
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
        const SizedBox(
          height: 10,
        ),
        const LatestItemListView(),
      ],
    );
  }
}
