import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 160,
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Color(0xfffeeeef),
                              ),
                              child: const Text(
                                '5.9 % Discount',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: controller.latestitemProducts[index].name.tr,
                        alignment: Alignment.center,
                        maxLines: 1,
                        fontSize: 13,
                        color: const Color(0xff39785c),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                '${controller.latestitemProducts[index].priceBeforeDiscount} SAR',
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: const Color(0xff868686),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomText(
                            text:
                                '${controller.latestitemProducts[index].price} SAR',
                            fontSize: 14,
                            color: const Color.fromARGB(255, 234, 57, 48),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff159d6d),
                          fixedSize: const Size(150, 40),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Add To Cart'.tr,
                              color: Colors.white,
                              fontSize: 16,
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
