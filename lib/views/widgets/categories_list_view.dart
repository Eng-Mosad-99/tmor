import 'package:flutter/material.dart';
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
        height: 103,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    '$categoryImagePath${controller.categories[index].img}',
                    height: 75,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 75,
                child: CustomText(
                  text: controller.categories[index].name,
                  fontSize: 14,
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
