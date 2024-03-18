import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/home_view_model.dart';
import 'package:tmor/views/widgets/custom_app_bar.dart';
import 'package:tmor/views/widgets/custom_search_text_field.dart';
import 'package:tmor/views/widgets/latest_item.dart';
import 'package:tmor/views/widgets/most_view_products_section.dart';
import 'package:tmor/views/widgets/page_view_builder.dart';
import '../constants.dart';
import 'details/discver_categories_items.dart';
import 'details/feature_items_details.dart';
import 'widgets/custom_text.dart';

class HomeView extends GetWidget<HomeViewModel> {
  const HomeView({super.key});

  final List<double> featuresDiscount = const [5.9, 9.1, 0, 0, 17, 99, 20, 17];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.sp),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: CustomAppBar(
              text: 'تمور المدينة',
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.sp, left: 20.sp, right: 20.sp),
          child: Column(
            children: [
              const CustomSearchTextField(),
              SizedBox(
                height: 20.h,
              ),
              const PageViewSlider(),
              SizedBox(
                height: 20.h,
              ),
              //// DiscoverCategoriesSection
              Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'Discover Categories'.tr,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const DiscoverCategoriesItems());
                        },
                        child: Container(
                          width: 40.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.sp),
                            color: const Color(0xffe8f9f1),
                          ),
                          child: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.green,
                            size: 22.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 100.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                '$categoryImagePath${controller.categories[index].img}',
                                height: 75.h,
                                width: 80.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 75.w,
                            child: CustomText(
                              text: controller.categories[index].name,
                              fontSize: 14.sp,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      itemCount: controller.categories.length,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              //// Feature Section
              Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'FEATURED ITEMS'.tr,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const FeatureItemDetails());
                        },
                        child: Container(
                          width: 40.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.sp),
                            color: const Color(0xffe8f9f1),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.green,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
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
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '$productsImagePath${controller.featuredProducts[index].image}',
                                        ),
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
                                      child: Text(
                                        '${featuresDiscount[index]} % Discount',
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
                                text: controller.featuredProducts[index].name,
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
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff159d6d),
                                fixedSize: Size(150.w, 40.h),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      itemCount: controller.featuredProducts.length,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: controller
                                .getCategoryproductsInHome[index].name,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          const Spacer(),
                          Container(
                            width: 40.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.sp),
                              color: const Color(0xffe8f9f1),
                            ),
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.green,
                              size: 22.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 290.h,
                        child: ListView.separated(
                          separatorBuilder: (context, prodIndex) => SizedBox(
                            width: 10.w,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, prodIndex) => SizedBox(
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
                                          borderRadius: BorderRadius.circular(
                                            16.sp,
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              '$productsImagePath${controller.getCategoryproductsInHome[index].productsList[prodIndex].image}',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            8.0.sp,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 8.sp,
                                          ),
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
                                    text: controller
                                        .getCategoryproductsInHome[index]
                                        .productsList[prodIndex]
                                        .name,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text:
                                          '${controller.getCategoryproductsInHome[index].productsList[prodIndex].priceBeforeDiscount} SAR',
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.lineThrough,
                                      color: const Color(0xff868686),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    CustomText(
                                      text:
                                          '${controller.getCategoryproductsInHome[index].productsList[prodIndex].price} SAR',
                                      fontSize: 14.sp,
                                      color: const Color.fromARGB(
                                          255, 234, 57, 48),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                          itemCount: controller.getCategoryproductsInHome[index]
                              .productsList.length,
                        ),
                      ),
                    ],
                  );
                },
                itemCount: controller.getCategoryproductsInHome.length,
              ),
              SizedBox(
                height: 15.h,
              ),
              const LatestItemsSection(),
              SizedBox(
                height: 15.h,
              ),
              const MostViewsProductsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
