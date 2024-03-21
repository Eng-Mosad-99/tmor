// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/views/control_view.dart';

import '../helper/local_storage_data.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final LocalStorageData localStorage = Get.find();
      bool isLogin = await localStorage.getData(true, 'isLogin') ?? false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ControlView(
            isLogin: isLogin,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage(
            'assets/images/logo.png',
          ),
          width: 300.w,
          height: 300.h,
        ),
      ),
    );
  }
}
