import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_online/app/core/widgets/no_data_found_widget.dart';
import 'package:movie_online/app/data/models/trad_list_response.dart';
import 'package:movie_online/app/extensions/padding_extenstion.dart';

import '../controllers/trades_controller.dart';

class TradesView extends GetView<TradesController> {
  /* TradesView({Key? key}) {
    controller.getTradeData();
  }*/

  @override
  Widget build(BuildContext context) {
    //controller.getTradeData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trades'),
        centerTitle: true,
      ),
      body: Obx(() =>
      controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.tradeList.isEmpty
          ? const NoDataFound()
          : Column(
        children: [
          Text(
            'Profit: ${controller.profit.toStringAsFixed(2)}',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: RefreshIndicator(
                onRefresh: () async{
                  controller.getTradeData();
                },
                child: ListView.separated(
                  itemCount: controller.tradeList.length,
                  itemBuilder: (ctx, i) =>
                      _tradeItem(controller.tradeList[i]),
                  separatorBuilder: (ctx, i) => 5.height,
                ),
              ))
        ],
      )),
    );
  }

  _tradeItem(Trade item) =>
      Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ticket: ${item.ticket}'),
              2.height,
              Text('Current Price: ${item.currentPrice}'),
              2.height,
              Text('Open Price: ${item.ticket}'),
              2.height,
              Text('Profit: ${item.profit}'),
              2.height,
              Text('Comment: ${item.comment}'),
              2.height,
              Text('Open time: ${item.openTime}'),
            ],
          ),
        ),
      );
}
