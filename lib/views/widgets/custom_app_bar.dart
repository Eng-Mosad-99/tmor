import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart_view.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.fontSize,
      this.text = '',
      this.color = Colors.black,
      this.fontWeight});
  final double? fontSize;
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
          ),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            Get.to(() => const CartView());
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
