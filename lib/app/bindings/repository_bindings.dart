
import 'package:movie_online/app/data/repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/data/repository/campaign_repo.dart';
import 'package:movie_online/app/data/repository/profile_repo.dart';
import 'package:movie_online/app/data/repository/trade_repo.dart';

class RepositoryBindings extends Bindings {
  @override
  void dependencies() {
    ///repositories
    Get.lazyPut<AuthRepo>(
            () => AuthRepo(),
        fenix: true
    );
    Get.lazyPut<TradeRepo>(
            () => TradeRepo(),
        fenix: true
    );
    Get.lazyPut<ProfileRepo>(
            () => ProfileRepo(),
        fenix: true
    );
    Get.lazyPut<CampaignRepo>(
            () => CampaignRepo(),
        fenix: true
    );
  }
}