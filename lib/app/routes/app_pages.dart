import 'package:get/get.dart';

import '../modules/campaign/bindings/campaign_binding.dart';
import '../modules/campaign/views/campaign_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/spalsh/bindings/spalsh_binding.dart';
import '../modules/spalsh/views/spalsh_view.dart';
import '../modules/trades/bindings/trades_binding.dart';
import '../modules/trades/views/trades_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPALSH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CAMPAIGN,
      page: () => const CampaignView(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: _Paths.TRADES,
      page: () => TradesView(),
      binding: TradesBinding(),
    ),
    GetPage(
      name: _Paths.SPALSH,
      page: () => SpalshView(),
      binding: SpalshBinding(),
    ),
  ];
}
