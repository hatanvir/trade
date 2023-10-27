import 'package:movie_online/app/data/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/data/services/campaign_service.dart';
import 'package:movie_online/app/data/services/profile_service.dart';
import 'package:movie_online/app/data/services/trade_service.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    ///services
    Get.lazyPut<AuthService>(
            () => AuthService(),
        fenix: true
    );

    Get.lazyPut<TradeService>(
            () => TradeService(),
        fenix: true
    );

    Get.lazyPut<ProfileService>(
            () => ProfileService(),
        fenix: true
    );

    Get.lazyPut<CampaignService>(
            () => CampaignService(),
        fenix: true
    );
   }
}