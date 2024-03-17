// ignore_for_file: prefer_final_fields, avoid_print
import 'dart:convert';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/core/services/api.dart';
import 'package:tmor/helper/local_storage_data.dart';
import 'package:tmor/models/user_model.dart';
import '../../views/auth/login_view.dart';
import '../../views/home_view.dart';

class AuthViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkUserLogin();
  }

  final LocalStorageData localStorage = Get.find();

  var isLogin = false;

  checkUserLogin() async {
    isLogin = await localStorage.getData(true, 'isLogin') ?? true;
    update();
  }

  var isPasswordHidden = true.obs;

  ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  String _countryCode = '+966';
  String get countryCode => _countryCode;

  // /// علشان بعد ما العميل يسجل دخول وبعد ما يقفل التطبيق ويفتحه ميعملش تسجيل دخول تاني
  // Rx<User?> _user = Rx<User?>(null);
  // String get user => _user.value?.mobile ?? '';

  Future<String> signUp({
    required String mobile,
    required String password,
    required String fullName,
    required String email,
    required String confirmPassword,
  }) async {
    try {
      print({
        'mobile': countryCode + mobile,
        'password': password,
        'fullName': fullName,
        'email': email,
        'confirmPassword': confirmPassword,
      });
      Map<String, dynamic> data = await API.post(
        file: 'users.php',
        action: 'userSignUp',
        body: {
          'mobile': countryCode + mobile,
          'password': password,
          'fullName': fullName,
          'email': email,
          'confirmPassword': confirmPassword,
        },
      );
      isLoading.value = true;
      print(data);
      if (data['success'] == true) {
        User user = User.fromJSon(data['data']);
        localStorage.setData(false, 'user', jsonEncode(user.toJson()));
        Get.offAll(LoginView());
        isLoading.value = false;
        update();
      } else {
        return data['message'];
      }
      return '';
    } catch (e) {
      isLoading.value = false;
      update();
      return e.toString();
    }
  }

  Future<String> signIn({
    required String phone,
    required String password,
  }) async {
    print({
      "mobile": countryCode + phone,
      "password": password,
    });
    Map<String, dynamic> data = await API.post(
      file: 'users.php',
      action: 'userSignIn',
      body: {
        "mobile": countryCode + phone,
        "password": password,
      },
    );
    if (kDebugMode) {
      print(data);
    }
    isLoading.value = true;
    if (data['success'] == true) {
      User user = User.fromJSon(data['data']);
      localStorage.setData(false, 'user', jsonEncode(user.toJson()));
      Get.offAll(() => const HomeView());
      isLoading.value = false;
      update();
    } else {
      Get.snackbar(
        'Login Error',
        data['message'],
        colorText: Colors.white,
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return '';
    // try {

    // } catch (e) {
    //   return e.toString();
    // }
  }

  Future<dynamic> forgetPassword({
    required String phone,
  }) async {
    try {
      print({
        "value": countryCode + phone,
      });
      Map<String, dynamic> data = await API.post(
        file: 'users.php',
        action: 'resetPassword',
        body: {
          "value": countryCode + phone,
        },
      );
      if (kDebugMode) {
        print(data);
      }
      if (data['success'] == true) {
        Get.snackbar('Successful', 'The password has reset successfully');
      }
    } catch (e) {
      return e.toString();
    }
  }

  void onCountryChange(CountryCode countryCode) {
    _countryCode = countryCode.dialCode!;
    update();
  }
}
