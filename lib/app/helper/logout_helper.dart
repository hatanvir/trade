import 'package:trade/app/data/shared_pref.dart';
import 'package:get/get.dart';
import 'package:trade/app/routes/app_pages.dart';

class LogoutHelper {
  static void logout() async {
    await SharedPref.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}