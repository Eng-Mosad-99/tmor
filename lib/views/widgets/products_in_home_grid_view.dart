// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tmor/core/view_model/home_view_model.dart';

// class ProductsInHomeGridView extends StatelessWidget {
//   const ProductsInHomeGridView({
//     super.key,
//     required this.colors,
//   });

//   final List<Color> colors;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeViewModel>(
//       builder: (controller) => GridView.builder(
//          itemBuilder: (context, indexx) {
//           return Expanded(
//             child: Container(
//               color: colors[index],
//             ),
//           );
//         },
//         itemCount:
//             controller.getCategoryproductsInHome[indexx].productsList.length,
//         scrollDirection: Axis.horizontal,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 10.sp,
//           crossAxisSpacing: 10.sp,
//           childAspectRatio: 3 / 4,
//         ),
       
//       ),
//     );
//   }
// }
