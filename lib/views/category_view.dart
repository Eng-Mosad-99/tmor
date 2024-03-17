import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/constants.dart';
import 'package:tmor/core/view_model/home_view_model.dart';
import 'package:tmor/views/home_view.dart';
import 'package:tmor/views/widgets/custom_text.dart';
import 'widgets/custom_search_text_field.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          children: [
            const CustomSearchTextField(),
            GetBuilder<HomeViewModel>(
              builder: (controller) => SizedBox(
                height: MediaQuery.of(context).size.height * .60,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                '$categoryImagePath${controller.categories[index].img}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        CustomText(
                          text: controller.categories[index].name,
                          fontSize: 14,
                          maxLines: 1,
                          alignment: Alignment.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
