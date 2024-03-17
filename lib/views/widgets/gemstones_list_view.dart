import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/view_model/home_view_model.dart';
import 'custom_text.dart';

class GemStonesGridView extends StatelessWidget {
  const GemStonesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 505,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 180,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://tmormadina.com/api/uploads/categories/3d11ef1729.png',
                            ),
                            // '$productsImagePath${controller.getCategoryproductsInHome[index].productsList[index].image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
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
                    text: 'DATA'.tr,
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
                    children: const [
                      CustomText(
                        text: '140.00 SAR',
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xff868686),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: '130.00 SAR',
                        fontSize: 14,
                        color: Color.fromARGB(255, 234, 57, 48),
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
              itemCount: 8,
            ),
          ),
        );
      },
    );
  }
}
