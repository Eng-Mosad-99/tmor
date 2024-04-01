import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tmor/core/services/api.dart';
import 'package:tmor/models/cart_product_model.dart';
import 'dart:developer';

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
    if (response["success"] == true) {
      await getAllCart();
    }
  }

  Future<void> getAllCart() async {
    // ignore: missing_required_param
    Map<String, dynamic> response = await API().post(
      file: 'users.php',
      action: 'getAllCart',
    );
    if (response['success'] == true) {
      _cartProductModel = CartProductModel.fromJson(response['data']);
      update();
    }
  }

  updateCartQuantity(
      {required int productQuantity,
      required String productId,
      int? index}) async {
    Map<String, dynamic> response = await API().post(
      file: 'users.php',
      action: 'updateCartQuantity',
      body: {
        'id': productId,
        'quantity': productQuantity,
      },
    );
    log('mohammed0000000');
    log('response');
    if (kDebugMode) {
      print(response);
    }
    if (response["success"] == true) {
      await getAllCart();
      log('mohammed111111111');
    }
    // update();
  }

  deleteOneCart({required ProductItems productItems}) async {
    var productIndex = _cartProductModel!.productsList.indexOf(productItems);
    _cartProductModel!.productsList.remove(productItems);
    update();
    Map<String, dynamic> response = await API().post(
      file: 'users.php',
      action: 'deleteCartOne',
      body: {
        'id': productItems.id,
      },
    );
    if (response['success'] == false) {
      _cartProductModel!.productsList.insert(productIndex, productItems);
    }
  }

  deleteAllCart() async {
    // ignore: missing_required_param
    Map<String, dynamic> response = await API().post(
      file: 'users.php',
      action: 'deleteCartAll',
    );

    if (response['success'] == true) {
      _cartProductModel = CartProductModel.fromJson(response);
      update();
    }
  }

  // increaseQuantity(int index) async {
  //   // _cartProductModel.productsList[index].quantity++;
  //   _totalPrice +=
  //       (double.tryParse(_cartProductModel!.productsList[index].price) ?? 10);
  //   update();
  // }

  // decreaseQuantity(int index) async {
  //   // _cartProductModel!.productsList[index].quantity--;

  //   _totalPrice -=
  //       (double.tryParse(_cartProductModel!.productsList[index].price) ?? 10);
  //   update();
  // }
}
