import 'package:flutter/material.dart';
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
              fontSize: 16,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20,
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
        const SizedBox(
          height: 10,
        ),
        const GiftAndPackagingListView(),
      ],
    );
  }
}
