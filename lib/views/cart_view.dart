import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/cart_view_model.dart';
import 'package:tmor/views/widgets/custom_text.dart';
import 'package:tmor/views/widgets/discount_text.dart';
import 'package:tmor/views/widgets/quantity_icon_botton.dart';
import '../constants.dart';
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
          GetBuilder<CartViewModel>(
            builder: (controller) => IconButton(
              onPressed: () {
                controller.deleteAllCart();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.black,
                size: 25.sp,
              ),
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
      body: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          controller.cartProductModel?.productsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: 16.sp,
                            left: 16.sp,
                            right: 16.sp,
                            bottom: 8.sp,
                          ),
                          width: double.infinity,
                          height: 250.sp,
                          decoration: BoxDecoration(
                            color: const Color(0xffe8f9f1),
                            borderRadius: BorderRadius.circular(16.sp),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.sp),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              10.sp,
                                            ),
                                          ),
                                          height: 150.sp,
                                          width: 100.sp,
                                          child: Image.network(
                                            '$productsImagePath${controller.cartProductModel?.productsList[index].img}',
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 180.sp,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0.sp),
                                                    child: CustomText(
                                                      text: controller
                                                          .cartProductModel!
                                                          .productsList[index]
                                                          .name,
                                                      alignment:
                                                          Alignment.center,
                                                      maxLines: 2,
                                                      fontSize: 18.sp,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 50.w,
                                                  height: 40.h,
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: 20.sp,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff159c6c),
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                              width: 120.sp,
                                              height: 40.sp,
                                              decoration: const BoxDecoration(
                                                color: Color(0xffffeeef),
                                              ),
                                              child: DiscountText(
                                                discountText:
                                                    '5.9 % ' 'Discount'.tr,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.sp,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: 'Quantity'.tr,
                                                ),
                                                SizedBox(
                                                  width: 50.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    print('Mesallam+++++++');
                                                    controller.increaseQuantity(
                                                        index);
                                                  },
                                                  child:
                                                      const QuantityIconBotton(
                                                    icon: Icons.add,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                CustomText(
                                                  text: controller
                                                      .cartProductModel!
                                                      .productsList[index]
                                                      .quantity
                                                      .toString(),
                                                  fontSize: 25.sp,
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    print('Mesallam--------');
                                                    controller.decreaseQuantity(
                                                        index);
                                                  },
                                                  child:
                                                      const QuantityIconBotton(
                                                    icon: Icons.remove,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.sp,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  text: controller
                                                      .cartProductModel!
                                                      .productsList[index]
                                                      .priceBeforeDiscount,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 16,
                                                ),
                                                SizedBox(
                                                  width: 10.sp,
                                                ),
                                                CustomText(
                                                  text: controller
                                                      .cartProductModel!
                                                      .productsList[index]
                                                      .price,
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
                                CustomText(
                                  color: const Color(0xff8aa59b),
                                  text: controller
                                          .cartProductModel?.totalProductCount
                                          .toString() ??
                                      '0',
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
                            CustomText(
                              color: const Color(0xff8aa59b),
                              text: controller.cartProductModel?.totalPrice
                                      .toString() ??
                                  '0',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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