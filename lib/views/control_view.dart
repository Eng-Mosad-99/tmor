// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import 'auth/login_view.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      builder: (controller) => controller.isLogin
          ? GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                bottomNavigationBar: buttomNavigationBar(),
                body: controller.currentScreen,
              ),
            )
          : LoginView(),
    );
  }
}

GetBuilder<ControlViewModel> buttomNavigationBar() {
  return GetBuilder<ControlViewModel>(
    builder: (controller) => BottomNavigationBar(
      unselectedItemColor: Colors.grey[400],
      items: const [
        BottomNavigationBarItem(
          label: 'home',
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: 'categories',
          icon: Icon(
            Icons.category,
          ),
        ),
        BottomNavigationBarItem(
          label: 'favorites',
          icon: Icon(
            Icons.favorite,
          ),
        ),
        BottomNavigationBarItem(
          label: 'more',
          icon: Icon(
            Icons.more_horiz,
          ),
        ),
      ],
      currentIndex: controller.navigatorValue,
      onTap: (index) {
        controller.changeSelectedValue(index);
      },
      elevation: 0.0,
      selectedItemColor: Colors.green,
    ),
  );
}