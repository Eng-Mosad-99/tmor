// ignore_for_file: prefer_final_fields, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tmor/core/services/api.dart';
import 'package:tmor/models/category_model.dart';
import 'package:tmor/models/latest_product_model.dart';
import 'package:tmor/models/product_model.dart';

import '../../models/most_viewed_model.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getAllCategories();
    getFeaturedProducts();
    categoryproductsInHome();
    latestItemProducts();
    mostViewedProducts();
  }

  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  List<CategoriesModel> get categories => _categoryList;
  List<CategoriesModel> _categoryList = [];

  List<FeaturedProducts> get featuredProducts => _featuredProducts;
  List<FeaturedProducts> _featuredProducts = [];

  List<LatestPRoductModel> get latestitemProducts => _latestitemProducts;
  List<LatestPRoductModel> _latestitemProducts = [];

  List<MostViewedProductModel> get mostViewsProducts => _mostViewsProducts;
  List<MostViewedProductModel> _mostViewsProducts = [];

  List<CategoryProduct> get getCategoryproductsInHome =>
      _getCategoryproductsInHome;
  List<CategoryProduct> _getCategoryproductsInHome = [];

  getAllCategories() async {
    Map<String, dynamic> response = await API().get(
      file: 'categories.php',
      action: 'getAllCategories',
    );
    isLoading.value = true;
    if (response["success"] == true) {
      isLoading.value = false;
      _categoryList = List.from(response['data'] ?? [])
          .map((e) => CategoriesModel.fromJson(e))
          .toList();
      update();
    }
  }

  getFeaturedProducts() async {
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getFeaturedProducts',
    );
    if (response['success'] == true) {
      _featuredProducts = List.from(response['data'])
          .map((e) => FeaturedProducts.fromJson(e))
          .toList();
      update();
    }
  }

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

  latestItemProducts() async {
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getLatestProducts',
    );

    if (response['success'] == true) {
      _latestitemProducts = List.from(response['data'])
          .map((e) => LatestPRoductModel.fromJson(e))
          .toList();
    }
  }

  mostViewedProducts() async {
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getPopularProducts',
    );

    if (response['success'] == true) {
      _mostViewsProducts = List.from(response['data'])
          .map((e) => MostViewedProductModel.fromJson(e))
          .toList();
    }
  }
}
