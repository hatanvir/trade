import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trade/app/core/widgets/custom_toast.dart';
import 'package:trade/app/data/repository/auth_repo.dart';
import 'package:trade/app/data/shared_pref.dart';
import 'package:trade/app/routes/app_pages.dart';

import '../../../core/base/general_response.dart';

class LoginController extends GetxController {
  AuthRepo authRepo = Get.find();

  var formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isShowingPass = false.obs;
  var isLoading = false.obs;
  String fcmToken = '';

  @override
  void onInit() {
    super.onInit();
    if(kDebugMode){
      idController.text = '2088888';
      passwordController.text = 'ral11lod';
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loginOperation() async {
    isLoading.value = true;
    GeneralResponse generalResponse = await authRepo.login(
      id: idController.text,
      pass: passwordController.text
    );

    if (generalResponse.statusCode == 200) {
      String token = generalResponse.data['token'];
      await SharedPref.setString(SharedPref.TOKEN, token);
      await SharedPref.setString(SharedPref.ID, idController.text);

      showToast(msg: 'Logged in successfully');
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      showToast(msg: generalResponse.data, isError: true);
    }
    isLoading.value = false;
  }
}
