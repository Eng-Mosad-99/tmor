// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/home_view_model.dart';
import '../../constants.dart';
import '../../core/widgets/custom_arrow_icon.dart';
import '../details/discver_categories_items.dart';
import 'custom_text.dart';

class DicoverCategoriesListView extends StatelessWidget {
  const DicoverCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Column(
        children: [
          CustomArrowItems(
            sectionName: 'Discover Categories'.tr,
            onTap: () {
              Get.to(() => const DiscoverCategoriesItems());
            },
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        '$categoryImagePath${controller.categories[index].img}',
                        height: 80.h,
                        width: 80.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 85.w,
                    child: CustomText(
                      alignment: Alignment.center,
                      text: controller.categories[index].name,
                      fontSize: 13.sp,
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
    );
  }
}
