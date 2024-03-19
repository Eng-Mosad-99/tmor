import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/views/widgets/products_in_home_grid_view.dart';
import '../../constants.dart';
import '../../core/view_model/home_view_model.dart';
import '../../core/widgets/custom_arrow_icon.dart';
import '../../core/widgets/custom_elevated_bottom_cart.dart';
import 'custom_text.dart';

class ProductsInHomeListView extends StatelessWidget {
  const ProductsInHomeListView({
    super.key,
  });
  final List<Color> colors = const [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.cyan,
    Colors.black,
    Colors.grey,
    Colors.brown,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomArrowItems(
                sectionName: controller.getCategoryproductsInHome[index].name,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                        '$productsImagePath${controller.getCategoryproductsInHome[index].productsList[prodIndex].image}'),
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
                            text: controller.getCategoryproductsInHome[index]
                                .productsList[prodIndex].name,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              color: const Color.fromARGB(255, 234, 57, 48),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const CustomElevatedBottomAddToCart(),
                      ],
                    ),
                  ),
                  itemCount: controller
                      .getCategoryproductsInHome[index].productsList.length,
                ),
              ),
            ],
          );
        },
        itemCount: controller.getCategoryproductsInHome.length,
      ),
    );
  }
}
