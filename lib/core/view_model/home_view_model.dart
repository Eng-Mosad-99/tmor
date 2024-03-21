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

  ValueNotifier<bool> _isCategoryLoading = ValueNotifier(false);

  ValueNotifier<bool> get isCategoryLoading => _isCategoryLoading;

  ValueNotifier<bool> _isFeaturedProducts = ValueNotifier(true);

  ValueNotifier<bool> get isFeaturedProducts => _isFeaturedProducts;

  ValueNotifier<bool> _isCategoryproductsInHome = ValueNotifier(true);

  ValueNotifier<bool> get isCategoryproductsInHome => _isCategoryproductsInHome;

  ValueNotifier<bool> _isLatestItemProducts = ValueNotifier(true);

  ValueNotifier<bool> get isLatestItemProducts => _isLatestItemProducts;

  ValueNotifier<bool> _isMostViewedProducts = ValueNotifier(true);

  ValueNotifier<bool> get isMostViewedProducts => _isMostViewedProducts;

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
    isCategoryLoading.value = true;
    Map<String, dynamic> response = await API().get(
      file: 'categories.php',
      action: 'getAllCategories',
    );

    if (response["success"] == true) {
      _categoryList = List.from(response['data'] ?? [])
          .map((e) => CategoriesModel.fromJson(e))
          .toList();
      isCategoryLoading.value = false;
      update();
    }
  }

  getFeaturedProducts() async {
    isFeaturedProducts.value = true;
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getFeaturedProducts',
    );

    if (response['success'] == true) {
      _featuredProducts = List.from(response['data'])
          .map((e) => FeaturedProducts.fromJson(e))
          .toList();
      isFeaturedProducts.value = false;
      update();
    }
  }

  categoryproductsInHome() async {
    isCategoryproductsInHome.value = true;
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getCategoryproductsInHome',
    );

    if (response['success'] == true) {
      _getCategoryproductsInHome = List.from(response['data'] ?? [])
          .map((e) => CategoryProduct.fromJson(e))
          .toList();
      isCategoryproductsInHome.value = false;
      update();
    }
  }

  latestItemProducts() async {
    isLatestItemProducts.value = true;
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getLatestProducts',
    );

    if (response['success'] == true) {
      _latestitemProducts = List.from(response['data'])
          .map((e) => LatestPRoductModel.fromJson(e))
          .toList();
      isLatestItemProducts.value = false;
      update();
    }
  }

  mostViewedProducts() async {
    isMostViewedProducts.value = true;
    Map<String, dynamic> response = await API().get(
      file: 'products.php',
      action: 'getPopularProducts',
    );

    if (response['success'] == true) {
      _mostViewsProducts = List.from(response['data'])
          .map((e) => MostViewedProductModel.fromJson(e))
          .toList();
      isMostViewedProducts.value = false;
      update();
    }
  }
}
