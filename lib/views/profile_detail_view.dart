import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmor/views/auth/login_view.dart';
import 'package:tmor/views/auth/register_screen.dart';
import 'package:tmor/views/widgets/custom_app_bar.dart';
import 'package:tmor/views/widgets/custom_elevated_button.dart';
import 'package:tmor/views/widgets/custom_text.dart';

class ProfileDetailView extends StatelessWidget {
  const ProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.sp),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: CustomAppBar(
            text: 'تمور المدينة',
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.sp),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xff159d6d),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Hi Guest!'.tr,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    CustomText(
                      text: 'Sign in to continue'.tr,
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.sp,
            ),
            CustomElevatedButton(
              onPressed: () {
                Get.offAll(RegisterView());
              },
              text: 'Create an account'.tr,
              backgroundColor: const Color(0xff159d6d),
              textColor: Colors.white,
              fontSize: 14.sp,
            ),
            SizedBox(
              height: 16.sp,
            ),
            CustomElevatedButton(
              onPressed: () {
                Get.offAll(LoginView());
              },
              text: 'Sign in'.tr,
              backgroundColor: Colors.white,
              textColor: const Color(0xff159d6d),
              fontSize: 14.sp,
            ),
            SizedBox(
              height: 50.sp,
              child: const Divider(
                color: Color(0xffe0e0e0),
                thickness: 1,
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 22.sp,
                ),
                title: CustomText(
                  text: 'Usage Policy'.tr,
                  fontSize: 16.sp,
                  color: const Color(0xff3b3b3b),
                ),
                leading: CircleAvatar(
                  radius: 25.sp,
                  backgroundColor: const Color(0xffe6faf7),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xff159d6d),
                    child: Center(
                      child: Image(
                        image: const AssetImage(
                          'assets/images/box.png',
                        ),
                        width: 25.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
