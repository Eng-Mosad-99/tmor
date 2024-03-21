import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../core/view_model/home_view_model.dart';
import 'custom_text.dart';

class LatestItemListView extends StatelessWidget {
  const LatestItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isLatestItemProducts.value
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 290.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.w,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                  height: 285.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w,
                        height: 180.h,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.sp),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    '$productsImagePath${controller.latestitemProducts[index].image}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.all(8.0.sp),
                                margin: EdgeInsets.symmetric(horizontal: 8.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.sp),
                                    topRight: Radius.circular(10.sp),
                                  ),
                                  color: const Color(0xfffeeeef),
                                ),
                                width: double.infinity,
                                child: Text(
                                  '5.9 % Discount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: CustomText(
                          text: controller.latestitemProducts[index].name,
                          alignment: Alignment.centerLeft,
                          maxLines: 1,
                          fontSize: 13.sp,
                          color: const Color(0xff39785c),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                '${controller.latestitemProducts[index].priceBeforeDiscount} SAR',
                            fontSize: 14.sp,
                            decoration: TextDecoration.lineThrough,
                            color: const Color(0xff868686),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomText(
                            text:
                                '${controller.latestitemProducts[index].price} SAR',
                            fontSize: 14.sp,
                            color: const Color.fromARGB(255, 234, 57, 48),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff159d6d),
                          fixedSize: Size(150.w, 40.h),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomText(
                                text: 'Add To Cart'.tr,
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            const Icon(
                              Icons.shopping_cart,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: controller.latestitemProducts.length,
              ),
            ),
    );
  }
}
