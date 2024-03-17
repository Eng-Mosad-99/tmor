import 'package:get/get.dart';
import 'package:tmor/core/view_model/app_language.dart';
import 'package:tmor/core/view_model/auth_view_model.dart';
import 'package:tmor/core/view_model/control_view_model.dart';
import 'package:tmor/core/view_model/home_view_model.dart';
import 'package:tmor/core/view_model/profile_view_model.dart';

import '../core/view_model/product_view_model.dart';
import '../views/auth/forget_password.dart';
import 'local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => ProductViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ForgetPasswordView());
    Get.lazyPut(() => AppLanguage());
    Get.lazyPut(() => ControlViewModel());
  }
}
