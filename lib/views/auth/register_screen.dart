// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, body_might_complete_normally_nullable

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/auth_view_model.dart';
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
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hntText: 'full Name'.tr,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Name.';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hntText: 'email'.tr,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email address.';
                      }
                      // Regular expression pattern to check email shape
                      const pattern =
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                      final regExp = RegExp(pattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hntText: 'mobile'.tr,
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone.';
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
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password.';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long.';
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
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hntText: 'confirm password'.tr,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password.';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match.';
                      }
                    },
                    onSaved: (value) {
                      confirmPasswordController.text = value!;
                    },
                  ),
                  const SizedBox(
                    height: 15,
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
                    text: 'Sign Up',
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
