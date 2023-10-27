import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_online/app/extensions/padding_extenstion.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getData();
        },
        child: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Center(child: _profileData()),
              )),
      ),
    );
  }

  _profileData() => Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 100,
                  )),

              10.height,

              Text('Name: ${controller.profileInfo.value.name}'),
              4.height,
              Text('Phone: ${controller.profileInfo.value.phone}'),
              4.height,
              Text('Balance: ${controller.profileInfo.value.balance}'),
              4.height,
              Text(
                  'Current Trades: ${controller.profileInfo.value.currentTradesCount}'),
              4.height,
              Text(
                  'Current Trade Volume: ${controller.profileInfo.value.currentTradesVolume}'),
              4.height,
              Text(
                  'Total Trade: ${controller.profileInfo.value.totalTradesCount}'),
              4.height,
              Text(
                  'Total Trade Volume: ${controller.profileInfo.value.totalTradesVolume}'),
              4.height,
              Text(
                  'Free Margin: ${controller.profileInfo.value.freeMargin?.toStringAsFixed(4)}'),
              4.height,
              Text('Currency: ${controller.profileInfo.value.currency}'),
              4.height,
              Text('Country: ${controller.profileInfo.value.country}'),
              4.height,
              Text('City: ${controller.profileInfo.value.city}'),
              4.height,
              Text('Address: ${controller.profileInfo.value.address}'),
              4.height,
              Text('Zip Code: ${controller.profileInfo.value.zipCode}'),
            ],
          ),
        ),
      );
}
