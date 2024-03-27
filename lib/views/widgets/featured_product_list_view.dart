import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/cart_view_model.dart';
import 'package:tmor/models/cart_product_model.dart';
import 'package:tmor/views/widgets/discount_text.dart';
import '../../constants.dart';
import '../../core/view_model/home_view_model.dart';
import '../../core/widgets/custom_arrow_icon.dart';
import '../../core/widgets/custom_elevated_bottom_cart.dart';
import '../details/feature_items_details.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class FeatureProductListView extends StatelessWidget {
  FeatureProductListView(
      {super.key, required this.featuresDiscount, this.cartProductModel});

  final List<double> featuresDiscount;
  final CartProductModel? cartProductModel;
  bool isButtonClicked = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isFeaturedProducts.value
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 325.h,
              child: Column(
                children: [
                  CustomArrowItems(
                    sectionName: 'FEATURED ITEMS'.tr,
                    onTap: () {
                      Get.to(() => const FeatureItemDetails());
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SizedBox(
                        height: 285.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '$productsImagePath${controller.featuredProducts[index].image}'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.all(8.0.sp),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8.sp),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.sp),
                                          topRight: Radius.circular(10.sp),
                                        ),
                                        color: const Color(0xfffeeeef),
                                      ),
                                      width: double.infinity,
                                      child: DiscountText(
                                        discountText:
                                            '${featuresDiscount[index]} % Discount'
                                                .tr,
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
                                text: controller.featuredProducts[index].name,
                                alignment: Alignment.center,
                                maxLines: 1,
                                fontSize: 13.sp,
                                color: const Color(0xff39785c),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text:
                                      '${controller.featuredProducts[index].priceBeforeDiscount} SAR',
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color(0xff868686),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                CustomText(
                                  text:
                                      '${controller.featuredProducts[index].price} SAR',
                                  fontSize: 14.sp,
                                  color: const Color.fromARGB(255, 234, 57, 48),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            GetBuilder<CartViewModel>(
                              init: CartViewModel(),
                              builder: (cartController) =>
                                  CustomElevatedBottomAddToCart(
                                onPressed: () {
                                  if (isButtonClicked == true) {
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.red,
                                      ),
                                    );
                                  } else {
                                    cartController.addProductToCart(
                                      quantity: 1,
                                      productId:
                                          controller.featuredProducts[index].id,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: controller.featuredProducts.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
