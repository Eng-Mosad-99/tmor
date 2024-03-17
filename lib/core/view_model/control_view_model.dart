import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/views/category_view.dart';
import 'package:tmor/views/favorite_view.dart';
import 'package:tmor/views/home_view.dart';
import 'package:tmor/views/profile_detail_view.dart';

class ControlViewModel extends GetxController {
  // ignore: prefer_final_fields
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  // ignore: prefer_final_fields
  Widget _currentScreen = const HomeView();
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = const HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = const CategoryView();
          break;
        }
      case 2:
        {
          _currentScreen = const FavoriteView();
          break;
        }
      case 3:
        {
          _currentScreen = const ProfileDetailView();
          break;
        }
    }
    update();
  }
}
