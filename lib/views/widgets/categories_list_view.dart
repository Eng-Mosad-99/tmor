import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constants.dart';
import '../../core/view_model/home_view_model.dart';
import 'custom_text.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => SizedBox(
        height: 103.h,
        child: ListView.separated(
          separatorBuilder: (context, index) =>  SizedBox(
            width: 10.w,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(
                width: 75.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.sp),
                  child: Image.network(
                    '$categoryImagePath${controller.categories[index].img}',
                    height: 75.h,
                    width: 50.w,
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
    );
  }
}
