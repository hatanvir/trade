import 'package:movie_online/app/core/base/general_response.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/data/services/trade_service.dart';

class TradeRepo {
  TradeService tradeService = Get.find();

  Future<GeneralResponse> getTradeData() async {
    return tradeService.getTradeData();
  }
}
