import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/views/widgets/custom_text.dart';
import 'home_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Colors.black,
              size: 25.sp,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.off(const HomeView());
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
        ),
        title: CustomText(
          text: 'Cart'.tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      top: 16.sp, left: 16.sp, right: 16.sp, bottom: 8.sp),
                  width: double.infinity,
                  height: 250.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xffe8f9f1),
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              height: 150.sp,
                              width: 100.sp,
                              child: Image.network(
                                'https://tmormadina.com/api/uploads/categories/3d11ef1729.png',
                                width: 50.sp,
                                height: 50.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 180.sp,
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0.sp),
                                        child: CustomText(
                                          text: 'DATA DATA DATA DATA DATA',
                                          alignment: Alignment.center,
                                          maxLines: 2,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff159c6c),
                                        borderRadius: BorderRadius.circular(
                                          10.sp,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp,
                                    vertical: 10.sp,
                                  ),
                                  width: 100.sp,
                                  height: 40.sp,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffffeeef),
                                  ),
                                  child: Text(
                                    '5.9 % Discount',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Quantity'.tr,
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Container(
                                      width: 40.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffcee3da),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        color: Colors.transparent,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 25.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    CustomText(
                                      text: '1',
                                      fontSize: 25.sp,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Container(
                                      width: 40.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffcee3da),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        color: Colors.transparent,
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        size: 25.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  children: [
                                    const CustomText(
                                      text: '30.00 SAR',
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 16,
                                    ),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    const CustomText(
                                      text: '25.00 SAR',
                                      color: Colors.red,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Color(0xff8aa59b),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Items Count'.tr,
                      color: const Color(0xff8aa59b),
                    ),
                    Row(
                      children: [
                        const CustomText(
                          color: Color(0xff8aa59b),
                          text: '2',
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: 'Item'.tr,
                          color: const Color(0xff8aa59b),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Total Price'.tr,
                      color: const Color(0xff8aa59b),
                    ),
                    const CustomText(
                      color: Color(0xff8aa59b),
                      text: '105.00',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
  SvgPicture.asset(
            'assets/images/undraw_empty_cart_co35.svg',
            width: 200.w,
            height: 200.h,
          ),
*/