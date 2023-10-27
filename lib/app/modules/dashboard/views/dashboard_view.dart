import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tread/app/routes/app_pages.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);
  final navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.TRADES,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index){
              controller.currentIndex.value = index;
              Get.toNamed(controller.bottomNavBodyRouteList[controller.currentIndex.value],id: 1);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: 'Trades'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.campaign), label: 'Campaign'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Profile')
            ],
          )),
    );
  }
}
