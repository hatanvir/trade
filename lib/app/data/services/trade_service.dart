import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tread/app/core/base/general_response.dart';
import 'package:tread/app/data/models/movie_response.dart';
import 'package:tread/app/data/models/trad_list_response.dart';
import 'package:tread/app/data/shared_pref.dart';
import 'package:tread/app/network/apis.dart';
import 'package:tread/app/network/base_api_provider.dart';
import 'package:tread/app/network/dio_exception.dart';

class TradeService extends BaseApiProvider {
  Future<GeneralResponse> getTradeData() async {
    try {
      var token = await SharedPref.getString(SharedPref.TOKEN);
      var id = await SharedPref.getString(SharedPref.ID);
      var request =
          await dio.post(Apis.getTrades,
            data: {
               'login': id,
               SharedPref.TOKEN: token
            }
          );
      if (request.statusCode == 200) {
        if (kDebugMode) {
          print(request.data);
        }
        return GeneralResponse(statusCode: 200, data: tradListResponseFromJson(request.data));
      }
      return GeneralResponse(
          statusCode: request.statusCode!, data: request.data);
    } catch (e) {
      return GeneralResponse(
          statusCode: 400, data: DioException.getDioException(e));
    }
  }
}
