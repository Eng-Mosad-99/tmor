import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/cart_view_model.dart';
import 'package:tmor/core/view_model/home_view_model.dart';
import 'package:tmor/models/cart_product_model.dart';
import 'package:tmor/views/widgets/custom_search_text_field.dart';
import 'package:tmor/views/widgets/custom_text.dart';
import 'package:tmor/views/widgets/discover_categories_listView.dart';
import 'package:tmor/views/widgets/featured_product_list_view.dart';
import 'package:tmor/views/widgets/latest_item.dart';
import 'package:tmor/views/widgets/most_view_products_section.dart';
import 'package:tmor/views/widgets/page_view_builder.dart';
import 'package:tmor/views/widgets/products_in_home_list_view.dart';
import 'cart_view.dart';

class HomeView extends GetWidget<HomeViewModel> {
  const HomeView({super.key});
  final List<double> featuresDiscount = const [5.9, 9.1, 0, 0, 17, 99, 20, 17];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            elevation: 0,
            titleSpacing: -30.sp,
            title: Row(
              children: [
                Text(
                  'تمور المدينة',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
              GetBuilder<CartViewModel>(
                builder: (controller) =>
                    controller.cartProductModel?.totalProductCount == 0 ||
                            controller.cartProductModel?.totalProductCount ==
                                null
                        ? IconButton(
                            onPressed: () {
                              Get.to(() => const CartView());
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => const CartView());
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.black,
                                  ),
                                ),
                                GetBuilder<CartViewModel>(
                                  builder: (controller) => CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 10,
                                    child: CustomText(
                                      text: controller.cartProductModel!
                                                  .totalProductCount ==
                                              0
                                          ? ''
                                          : controller.cartProductModel!
                                              .totalProductCount
                                              .toString(),
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
              ),
            ],
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
                const DiscoverCategoriesListView(),
                SizedBox(
                  height: 15.h,
                ),
                FeatureProductListView(featuresDiscount: featuresDiscount),
                const ProductsInHomeListView(),
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
      ),
    );
  }
}
