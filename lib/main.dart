import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmor/utils/translations.dart';
import 'package:tmor/views/splash_view.dart';

import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const TmorApp());
}

class TmorApp extends StatelessWidget {
  const TmorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(407, 722),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            initialBinding: Binding(),
            translations: Translation(),
            locale:  Get.deviceLocale,
            fallbackLocale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          );
        });
  }
}
