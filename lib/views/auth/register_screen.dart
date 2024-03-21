// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, body_might_complete_normally_nullable

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/auth_view_model.dart';
import 'package:tmor/views/auth/login_view.dart';
import 'package:tmor/views/widgets/custom_elevated_button.dart';
import 'package:tmor/views/widgets/custom_text_form_filed.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Sign Up'.tr,
                    style: TextStyle(
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFormField(
                    hntText: 'full Name'.tr,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Name.'.tr;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFormField(
                    hntText: 'email'.tr,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email address.'.tr;
                      }
                      // Regular expression pattern to check email shape
                      const pattern =
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                      final regExp = RegExp(pattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address.'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFormField(
                    hntText: 'Mobile'.tr,
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone.'.tr;
                      }
                    },
                    prefixIcon: CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.blue,
                        title: const Text('تمور المدينة'),
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(
                    () => CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password.'.tr;
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long.'
                              .tr;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passwordController.text = value!;
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
                    height: 15.h,
                  ),
                  CustomTextFormField(
                    hntText: 'confirm password'.tr,
                    controller: confirmPasswordController,
                    obscureText: controller.isConfirmPasswordHidden.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isConfirmPasswordHidden.value =
                            !controller.isConfirmPasswordHidden.value;
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password.';
                      }
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return 'Passwords do not match.'.tr;
                      }
                    },
                    onSaved: (value) {
                      confirmPasswordController.text = value!;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () async {
                      try {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          var result = await controller.signUp(
                            email: emailController.text,
                            fullName: nameController.text,
                            mobile: mobileController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                          if (result.isNotEmpty) {
                            if (kDebugMode) {
                              print(result);
                            }
                          }
                        }
                      } on Exception catch (e) {
                        // Anything else that is an exception
                        Get.snackbar(
                          'Unknown exception:',
                          e.toString(),
                        );
                        // if (kDebugMode) {
                        //   print('Unknown exception: $e');
                        // } // <------------------
                      } catch (e) {
                        Get.snackbar("Register Error", e.toString());
                        // No specified type, handles all
                        // if (kDebugMode) {
                        //   print('Something really unknown: $e');
                        // }
                      }
                    },
                    text: 'Sign Up'.tr,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
