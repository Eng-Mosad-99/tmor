import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/core/services/api.dart';
import 'package:tmor/models/cart_product_model.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getAllCart();
  }

  // ignore: prefer_final_fields
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  CartProductModel? _cartProductModel;
  CartProductModel? get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  // ignore: prefer_final_fields
  double _totalPrice = 0.0;

  addProductToCart({required int quantity, required String productId}) async {
    Map<String, dynamic> response = await API().post(
      file: 'users.php',
      action: 'addToCart',
      body: {
        'product_id': productId,
        'quantity': quantity,
      },
    );
    print('000000000000000000000000000000000');
    print(response);
    if (response["success"] == true) {
      await getAllCart();
    }
    return response;
  }

  Future<void> getAllCart() async {
    // ignore: missing_required_param
    Map<String, dynamic> response = await API().post(
      body: {},
      file: 'users.php',
      action: 'getAllCart',
    );
    if (response['success'] == true) {
      _cartProductModel = CartProductModel.fromJson(response['data']);
    }
  }

  // increaseQuantity(int index) async {
  //   _cartProductModel!.productsList[index].quantity++;

  //   _totalPrice +=
  //       (double.tryParse(_cartProductModel!.totalPrice.toString()) ?? 0);
  //   update();
  // }

  // decreaseQuantity(int index) async {
  //   _cartProductModel!.productsList[index].quantity--;

  //   _totalPrice +=
  //       (double.tryParse(_cartProductModel!.totalPrice.toString()) ?? 0);
  //   update();
  // }
}
