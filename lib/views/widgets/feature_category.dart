// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tmor/core/view_model/home_view_model.dart';
// import 'package:tmor/views/widgets/custom_text.dart';

// class FeatureCategory extends StatelessWidget {
//   const FeatureCategory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeViewModel>(
//       builder: (controller) => SizedBox(
//         height: 285,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 150,
//               height: 180,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       image: const DecorationImage(
//                         image: NetworkImage(
//                           'https://tmormadina.com/api/uploads/categories/3d11ef1729.png',
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       padding: const EdgeInsets.all(8.0),
//                       margin: const EdgeInsets.symmetric(horizontal: 8),
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                         color: Color(0xfffeeeef),
//                       ),
//                       width: double.infinity,
//                       child: const Text(
//                         '5.9 % Discount',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             const CustomText(
//               text: 'Habat Albaraka honey (kilo)',
//               alignment: Alignment.centerLeft,
//               fontSize: 13,
//               color: Color(0xff39785c),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: const [
//                 CustomText(
//                   text: '170.00 SAR',
//                   fontSize: 14,
//                   color: Color(0xff868686),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 CustomText(
//                   text: '160.00 SAR',
//                   fontSize: 14,
//                   color: Color.fromARGB(255, 234, 57, 48),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xff159d6d),
//                 fixedSize: const Size(150, 40),
//               ),
//               onPressed: () {},
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   CustomText(
//                     text: 'Add To Cart',
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                   Icon(
//                     Icons.shopping_cart,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
