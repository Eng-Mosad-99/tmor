import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../core/view_model/home_view_model.dart';
import 'custom_text.dart';

class MostViewedItemListView extends StatelessWidget {
  const MostViewedItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) {
        return SizedBox(
          height: 290,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              height: 285,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 180,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(
                                '$productsImagePath${controller.mostViewsProducts[index].image}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: Color(0xfffeeeef),
                            ),
                            width: double.infinity,
                            child: const Text(
                              '5.9 % Discount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 150,
                    child: CustomText(
                      text: controller.mostViewsProducts[index].name,
                      alignment: Alignment.centerLeft,
                      maxLines: 1,
                      fontSize: 13,
                      color: const Color(0xff39785c),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                            '${controller.mostViewsProducts[index].priceBeforeDiscount} SAR',
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: const Color(0xff868686),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text:
                            '${controller.mostViewsProducts[index].price} SAR',
                        fontSize: 14,
                        color: const Color.fromARGB(255, 234, 57, 48),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
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
            ),
            itemCount: controller.mostViewsProducts.length,
          ),
        );
      },
    );
  }
}
