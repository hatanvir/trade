import 'package:trade/app/core/base/general_response.dart';
import 'package:get/get.dart';
import 'package:trade/app/data/services/trade_service.dart';

class TradeRepo {
  TradeService tradeService = Get.find();

  Future<GeneralResponse> getTradeData() async {
    return tradeService.getTradeData();
  }
}
