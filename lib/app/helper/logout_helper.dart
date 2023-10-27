import 'package:movie_online/app/data/shared_pref.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/routes/app_pages.dart';

class LogoutHelper {
  static void logout() async {
    await SharedPref.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}