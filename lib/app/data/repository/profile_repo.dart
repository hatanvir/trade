import 'package:trade/app/core/base/general_response.dart';
import 'package:trade/app/data/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:trade/app/data/services/profile_service.dart';

class ProfileRepo {
  ProfileService profileService = Get.find();

  Future<GeneralResponse> getProfileData() async {
    return profileService.getProfileData();
  }

  Future<GeneralResponse> getPhoneNumber() async {
    return profileService.getPhoneNum();
  }
}
