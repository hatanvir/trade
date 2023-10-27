import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:trade/app/core/base/general_response.dart';
import 'package:trade/app/network/apis.dart';
import 'package:trade/app/network/base_api_provider.dart';
import 'package:trade/app/network/dio_exception.dart';

class AuthService extends BaseApiProvider {
  Future<GeneralResponse> login(
      {required String id, required String pass}) async {
    try {
      var request =
          await dio.post(Apis.login, data: {'login': id, 'password': pass});
      if (request.statusCode == 200) {
        if (kDebugMode) {
          print(request.data);
        }
        return GeneralResponse(statusCode: 200, data: request.data);
      }
      return GeneralResponse(
          statusCode: request.statusCode!, data: request.data);
    } catch (e) {
      return GeneralResponse(
          statusCode: 400, data: DioException.getDioException(e));
    }
  }
}
