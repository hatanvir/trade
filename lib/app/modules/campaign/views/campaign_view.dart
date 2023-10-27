import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_online/app/core/widgets/no_data_found_widget.dart';
import 'package:movie_online/app/extensions/padding_extenstion.dart';

import '../controllers/campaign_controller.dart';

class CampaignView extends GetView<CampaignController> {
  const CampaignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Campaign'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.campaignList.isEmpty
                ? const NoDataFound()
                : ListView.separated(
                    itemCount: controller.campaignList.length,
                    itemBuilder: (ctx, i) => Text(
                        (controller.campaignList[i].currentPrice ?? 0)
                            .toString()),
                    separatorBuilder: (ctx, i) => 5.height,
                  )));
  }
}
