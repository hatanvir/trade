import 'package:get/get.dart';
import 'package:tread/app/core/base/general_response.dart';
import 'package:tread/app/core/widgets/custom_toast.dart';
import 'package:tread/app/data/models/trad_list_response.dart';
import 'package:tread/app/data/repository/trade_repo.dart';

class TradesController extends GetxController {
  TradeRepo tradeRepo = Get.find();

  var tradeList = <Trade>[].obs;

  var isLoading = false.obs;
  var profit = (0.0).obs;

  @override
  void onInit() {
    super.onInit();
    print('called');
  }

  @override
  void onReady() {
    super.onReady();
    getTradeData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getTradeData() async{
     isLoading.value = true;
       GeneralResponse generalResponse = await tradeRepo.getTradeData();
       if(generalResponse.statusCode == 200){
         tradeList.value = generalResponse.data;
         profit.value = tradeList.map((e) => e.profit)
         .reduce((value, element) => (value??0)+(element??0).toDouble())??0;
       }else{
         showToast(msg: generalResponse.data,isError: true);
       }
     isLoading.value = false;
  }
}
