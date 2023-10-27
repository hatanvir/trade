import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trade/app/modules/campaign/bindings/campaign_binding.dart';
import 'package:trade/app/modules/campaign/views/campaign_view.dart';
import 'package:trade/app/modules/profile/bindings/profile_binding.dart';
import 'package:trade/app/modules/profile/views/profile_view.dart';
import 'package:trade/app/modules/trades/bindings/trades_binding.dart';
import 'package:trade/app/modules/trades/views/trades_view.dart';
import 'package:trade/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  var bottomNavBodyRouteList = [Routes.TRADES,Routes.CAMPAIGN,Routes.PROFILE];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.TRADES) {
      return GetPageRoute(
        settings: settings,
        page: () => TradesView(),
        binding: TradesBinding(),
      );
    }

    if (settings.name == Routes.CAMPAIGN) {
      return GetPageRoute(
        settings: settings,
        page: () => CampaignView(),
        binding: CampaignBinding(),
      );
    }

    if (settings.name == Routes.PROFILE) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfileView(),
        binding: ProfileBinding(),
      );
    }

    return null;
  }
}
