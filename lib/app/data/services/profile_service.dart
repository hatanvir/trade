import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tread/app/core/base/general_response.dart';
import 'package:tread/app/data/models/movie_response.dart';
import 'package:tread/app/data/models/profile_info_response.dart';
import 'package:tread/app/data/shared_pref.dart';
import 'package:tread/app/network/apis.dart';
import 'package:tread/app/network/base_api_provider.dart';
import 'package:tread/app/network/dio_exception.dart';

class ProfileService extends BaseApiProvider {
  Future<GeneralResponse> getProfileData() async {
    try {
      var token = await SharedPref.getString(SharedPref.TOKEN);
      var id = await SharedPref.getString(SharedPref.ID);
      var response =
          await dio.post(Apis.getProfileData,
              data: {
                'login': id,
                SharedPref.TOKEN: token
              });
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        return GeneralResponse(statusCode: 200, data: profileInfoResponseFromJson(response.data));
      }
      return GeneralResponse(
          statusCode: response.statusCode!, data: response.data);
    } catch (e) {
      return GeneralResponse(
          statusCode: 400, data: DioException.getDioException(e));
    }
  }

  Future<GeneralResponse> getPhoneNum() async {
    try {
      var token = await SharedPref.getString(SharedPref.TOKEN);
      var id = await SharedPref.getString(SharedPref.ID);
      var response =
      await dio.post(Apis.getPhoneNum,
          data: {
            'login': id,
            SharedPref.TOKEN: token
          });
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        return GeneralResponse(statusCode: 200, data: response.data);
      }
      return GeneralResponse(
          statusCode: response.statusCode!, data: response.data);
    } catch (e) {
      return GeneralResponse(
          statusCode: 400, data: DioException.getDioException(e));
    }
  }
}
