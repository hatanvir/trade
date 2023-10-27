import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trade/app/core/base/general_response.dart';
import 'package:trade/app/network/apis.dart';
import 'package:trade/app/network/base_api_provider.dart';
import 'package:trade/app/network/dio_exception.dart';

class CampaignService extends BaseApiProvider {
  Future<GeneralResponse> getCampaignData() async {
    try {
      const String soapRequest = '''
   <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" 
                     xmlns:web="https://forex-images.ifxdb.com">
     <soapenv:Header/>
     <soapenv:Body>
       <web:GetCCPromo>
         <web:lang>en</web:lang>
       </web:GetCCPromo>
     </soapenv:Body>
   </soapenv:Envelope>
  ''';

      var request =
          await dio.post('https://api-forexcopy.contentdatapro.com/Services/CabinetMicroService.svc?wsdl',
          options: Options(
            headers: {
              'Content-Type': 'text/xml',
              'SOAPAction': 'https://forex-images.ifxdb.com/ICabinetMicroService/GetCCPromo',

            }
          ),
          data: soapRequest);
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
          statusCode: 400, data: "Something went wrong");
    }
  }
}
