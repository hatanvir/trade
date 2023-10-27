import 'package:movie_online/app/core/base/general_response.dart';
import 'package:movie_online/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class AuthRepo {
  AuthService authService = Get.find();

  Future<GeneralResponse> login(
      {required String id, required String pass}) async {
    return authService.login(id: id, pass: pass);
  }
}
