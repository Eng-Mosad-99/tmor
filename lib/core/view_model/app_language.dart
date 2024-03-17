// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/utils/languuage_local_storage.dart/local_storage.dart';

class AppLanguage extends GetxController {
  var appLocale = 'ar';
  @override
  void onInit() async {
    super.onInit();
    LanguageLocalStorage languageLocalStorage = LanguageLocalStorage();
    // ignore: prefer_if_null_operators
    appLocale = await languageLocalStorage.localLanguageSelected == null
        ? 'ar'
        : await languageLocalStorage.localLanguageSelected as String;
    Get.updateLocale(Locale(appLocale));
    update();
  }

  void changeLocalLanguage(String type) async {
    LanguageLocalStorage languageLocalStorage = LanguageLocalStorage();
    if (appLocale == type) return;
    if (type == 'ar') {
      appLocale = 'ar';
      languageLocalStorage.saveLocalLanguage('ar');
    } else {
      appLocale = 'en';
      languageLocalStorage.saveLocalLanguage('en');
    }
    update();
  }
}
