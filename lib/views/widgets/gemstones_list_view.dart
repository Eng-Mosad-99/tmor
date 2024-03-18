import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/view_model/home_view_model.dart';
import 'custom_text.dart';

class GemStonesGridView extends StatelessWidget {
  const GemStonesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 505.h,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5.sp,
                crossAxisSpacing: 10.sp,
                mainAxisSpacing: 10.sp,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 180.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://tmormadina.com/api/uploads/categories/3d11ef1729.png',
                            ),
                            // '$productsImagePath${controller.getCategoryproductsInHome[index].productsList[index].image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8.sp),
                          margin: EdgeInsets.symmetric(horizontal: 10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.sp),
                              topRight: Radius.circular(10.sp),
                            ),
                            color: const Color(0xfffeeeef),
                          ),
                          child: Text(
                            '5.9 % Discount',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomText(
                    text: 'DATA'.tr,
                    alignment: Alignment.center,
                    maxLines: 1,
                    fontSize: 13.sp,
                    color: const Color(0xff39785c),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '140.00 SAR',
                        fontSize: 14.sp,
                        decoration: TextDecoration.lineThrough,
                        color: const Color(0xff868686),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: '130.00 SAR',
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 234, 57, 48),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff159d6d),
                      fixedSize:  Size(150.w, 40.h),
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
                  ),
                ],
              ),
              itemCount: 8,
            ),
          ),
        );
      },
    );
  }
}
