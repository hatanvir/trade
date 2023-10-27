import 'package:tread/app/core/base/general_response.dart';
import 'package:tread/app/data/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:tread/app/data/services/campaign_service.dart';

class CampaignRepo {
  CampaignService campaignService = Get.find();

  Future<GeneralResponse> getCampaign() async {
    return campaignService.getCampaignData();
  }
}
