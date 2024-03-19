import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/core/services/api.dart';

class CartViewModel extends GetxController {
  // ignore: prefer_final_fields
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  addProductToCart(int quantity, int productId) async {
     Map<String, dynamic> response = await API().post(
      file: 'users.php',
      action: 'addToCart',
      body: {
        'product_id': productId.toString(),
        'quantity': quantity.toString(),
      },
    );
    return response;
  }
}


/*
  categoryproductsInHome() async {
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getCategoryproductsInHome',
    );

    if (response['success'] == true) {
      _getCategoryproductsInHome = List.from(response['data'] ?? [])
          .map((e) => CategoryProduct.fromJson(e))
          .toList();
      update();
    }
  }
 */