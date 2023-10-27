import 'package:get/get.dart';
import 'package:movie_online/app/core/base/general_response.dart';
import 'package:movie_online/app/core/widgets/custom_toast.dart';
import 'package:movie_online/app/data/models/profile_info_response.dart';
import 'package:movie_online/app/data/repository/profile_repo.dart';

class ProfileController extends GetxController {
  ProfileRepo profileRepo = Get.find();

  var isLoading = false.obs;
  var profileInfo = ProfileInfoResponse().obs;
  var phoneNum = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getData() async{
    isLoading.value = true;
    await getProfileData();
    await getPhoneNum();
    isLoading.value = false;
  }

  Future getProfileData() async{
    GeneralResponse generalResponse = await profileRepo.getProfileData();
    if(generalResponse.statusCode == 200){
      profileInfo.value = generalResponse.data;
    }else{
      showToast(msg: generalResponse.data,isError: true);
    }
  }


  Future getPhoneNum() async{
   GeneralResponse generalResponse = await profileRepo.getPhoneNumber();
    if(generalResponse.statusCode == 200){
      phoneNum.value = generalResponse.data;
    }else{
      showToast(msg: generalResponse.data,isError: true);
    }
  }
}
