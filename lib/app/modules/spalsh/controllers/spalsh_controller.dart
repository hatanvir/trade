import 'package:get/get.dart';
import 'package:trade/app/data/shared_pref.dart';
import 'package:trade/app/routes/app_pages.dart';

class SpalshController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkLoginStatus() async{
    String? token = await SharedPref.getString(SharedPref.TOKEN);
    await Future.delayed(const Duration(seconds: 2));
    if((token??'').isNotEmpty){
      Get.offAllNamed(Routes.DASHBOARD);
    }else{
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
