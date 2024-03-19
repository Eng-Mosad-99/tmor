import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../views/widgets/custom_text.dart';

class CustomElevatedBottomAddToCart extends StatelessWidget {
  const CustomElevatedBottomAddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff159d6d),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'Add To Cart'.tr,
            color: Colors.white,
            fontSize: 16.sp,
          ),
          const Icon(
            Icons.shopping_cart,
          ),
        ],
      ),
    );
  }
}
