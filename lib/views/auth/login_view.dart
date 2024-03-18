import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/app_language.dart';
import 'package:tmor/core/view_model/auth_view_model.dart';
import 'package:tmor/views/home_view.dart';
import 'package:tmor/views/widgets/custom_elevated_button.dart';
import 'package:tmor/views/widgets/custom_text.dart';
import 'package:tmor/views/widgets/custom_text_form_filed.dart';

import 'forget_password.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class LoginView extends GetWidget<AuthViewModel> {
  LoginView({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Login'.tr,
                      style:  TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 200.w,
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone.';
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          return null;
                        }
                      },
                      hntText: 'phone'.tr,
                      controller: mobileController,
                      prefixIcon: CountryListPick(
                          appBar: AppBar(
                            leading: IconButton(
                              onPressed: () {
                                Get.off(LoginView());
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                            automaticallyImplyLeading: true,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            elevation: 0.0,
                            title: const Text(
                              'تمور المدينة',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          theme: CountryTheme(
                            isShowTitle: false,
                            isShowFlag: true,
                            isShowCode: false,
                            isDownIcon: false,
                            showEnglishName: false,
                          ),
                          initialSelection: controller.countryCode,
                          onChanged: (countryCode) {
                            controller.onCountryChange(countryCode!);
                          }
                          // name of country
                          ),
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password.';
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                          return null;
                        },
                        obscureText: controller.isPasswordHidden.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isPasswordHidden.value =
                                !controller.isPasswordHidden.value;
                          },
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: controller.isPasswordHidden.value
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                        controller: passwordController,
                        hntText: 'Password'.tr,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(ForgetPasswordView());
                        },
                        child: CustomText(
                          alignment: Alignment.centerLeft,
                          text: 'Forget Password ?'.tr,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    CustomElevatedButton(
                      onPressed: () async {
                        try {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            String result = await controller.signIn(
                              phone: mobileController.text,
                              password: passwordController.text,
                            );

                            if (result.isNotEmpty) {
                              if (kDebugMode) {
                                print(result);
                              }
                            }
                          }
                        } on Exception catch (e) {
                          // Anything else that is an exception
                          if (kDebugMode) {
                            print('Unknown exception: $e');
                          } // <------------------
                        } catch (e) {
                          // No specified type, handles all
                          if (kDebugMode) {
                            print('Something really unknown: $e');
                          }
                        }
                      },
                      text: 'Sign In'.tr,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: 'Don\'t have an account ?'.tr,
                      fontSize: 16.sp,
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Get.to(RegisterView());
                      },
                      text: 'Sign Up'.tr,
                      backgroundColor: Colors.white,
                      textColor: Colors.green,
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.offAll(const HomeView());
                      },
                      child: CustomText(
                        text: 'Skip'.tr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Change Language'.tr,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                         SizedBox(
                          width: 10.w,
                        ),
                        GetBuilder<AppLanguage>(
                          builder: (controller) => DropdownButton(
                            value: controller.appLocale,
                            items: [
                              DropdownMenuItem(
                                value: 'en',
                                child: Text(
                                  'English'.tr,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'ar',
                                child: Text(
                                  'Arabic'.tr,
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              controller.changeLocalLanguage(value!);
                              Get.updateLocale(Locale(value));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
