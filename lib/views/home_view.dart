import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/home_view_model.dart';
import 'package:tmor/views/widgets/custom_app_bar.dart';
import 'package:tmor/views/widgets/custom_search_text_field.dart';
import 'package:tmor/views/widgets/discover_categories_listView.dart';
import 'package:tmor/views/widgets/featured_product_list_view.dart';
import 'package:tmor/views/widgets/latest_item.dart';
import 'package:tmor/views/widgets/most_view_products_section.dart';
import 'package:tmor/views/widgets/page_view_builder.dart';
import 'package:tmor/views/widgets/products_in_home_list_view.dart';

class HomeView extends GetWidget<HomeViewModel> {
  const HomeView({super.key});
  final List<double> featuresDiscount = const [5.9, 9.1, 0, 0, 17, 99, 20, 17];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: CustomAppBar(
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
              const DicoverCategoriesListView(),
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
    );
  }
}
