import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/core/services/api.dart';
import 'package:tmor/models/cart_product_model.dart';

class CartViewModel extends GetxController {
  // ignore: prefer_final_fields
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductList = [];
  List<CartProductModel> get cartProductList => _cartProductList;

  addProductToCart(int quantity, int productId) async {
    Map<String, dynamic> response = await API().post(
      file: 'users.php',
      action: 'addToCart',
      body: {
        'product_id': productId.toString(),
        'quantity': quantity.toString(),
      },
    );
    if (response['success'] == true) {
      _cartProductList = List.from(response['data'] ?? [])
          .map((e) => CartProductModel.fromJson(e))
          .toList();
      update();
    }
  }
}
