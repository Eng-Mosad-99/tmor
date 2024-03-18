// ignore_for_file: must_be_immutable

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/core/view_model/auth_view_model.dart';
import 'package:tmor/views/widgets/custom_elevated_button.dart';
import 'package:tmor/views/widgets/custom_text.dart';
import 'package:tmor/views/widgets/custom_text_form_filed.dart';

import 'login_view.dart';

class ForgetPasswordView extends GetWidget<AuthViewModel> {
  ForgetPasswordView({super.key});

  TextEditingController mobileController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomText(
          text: 'Forget Password'.tr,
        ),
        leading: IconButton(
          onPressed: () {
            Get.off(LoginView());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(
          left: 20.sp,
          right: 20.sp,
          bottom: 50.sp,
          top: 150.sp,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Enter the email address associated with your account , Click to have a password reset link e-mailed to you'
                    .tr,
                style:  TextStyle(
                  height: 2.h,
                ),
              ),
               SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone.';
                  }
                  return null;
                },
                hntText: 'Mobile Number'.tr,
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
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  },
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () async {
                  try {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate()) {
                      var result = await controller.forgetPassword(
                        phone: mobileController.text,
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
                text: 'Continue'.tr,
                backgroundColor: Colors.white,
                textColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
