import 'package:get/get.dart';
import 'package:movie_online/app/core/base/general_response.dart';
import 'package:movie_online/app/data/repository/campaign_repo.dart';

class CampaignController extends GetxController {
  CampaignRepo campaignRepo = Get.find();
  var isLoading = false.obs;
  var campaignList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getCampaign();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCampaign() async{
    isLoading.value = true;
    GeneralResponse response = await campaignRepo.getCampaign();
    if(response.statusCode == 200){
      campaignList.value = response.data;
    }
    isLoading.value = false;
  }
}
