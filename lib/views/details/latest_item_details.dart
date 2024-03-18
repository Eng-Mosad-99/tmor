import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/home_view_model.dart';
import 'package:tmor/views/widgets/custom_text.dart';
import '../../constants.dart';
import '../home_view.dart';

class LatestItemDetails extends StatelessWidget {
  const LatestItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: 'Latest ITEMS'.tr,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.off(const HomeView());
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
            color: Colors.black,
          )
        ],
      ),
      body: GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.sp,
                  mainAxisSpacing: 10.sp,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 160.w,
                            height: 64.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              image: DecorationImage(
                                image: NetworkImage(
                                  '$productsImagePath${controller.latestitemProducts[index].image}',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8.sp),
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.sp,
                              ),
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
                        text: controller.latestitemProducts[index].name.tr,
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
                            text:
                                '${controller.latestitemProducts[index].priceBeforeDiscount} SAR',
                            fontSize: 14.sp,
                            decoration: TextDecoration.lineThrough,
                            color: const Color(0xff868686),
                          ),
                          SizedBox(
                            width: 5.h,
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
                        height: 10.h,
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
                  childCount: controller.latestitemProducts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
