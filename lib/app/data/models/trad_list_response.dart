import 'dart:convert';

List<Trade> tradListResponseFromJson(List<dynamic> list) => List<Trade>.from((list.map((x) => Trade.fromJson(x))));

class Trade {
  double? currentPrice;
  dynamic comment;
  int? digits;
  int? login;
  double? openPrice;
  DateTime? openTime;
  double? profit;
  double? sl;
  double? swaps;
  String? symbol;
  double? tp;
  int? ticket;
  int? type;
  double? volume;

  Trade({
    this.currentPrice,
    this.comment,
    this.digits,
    this.login,
    this.openPrice,
    this.openTime,
    this.profit,
    this.sl,
    this.swaps,
    this.symbol,
    this.tp,
    this.ticket,
    this.type,
    this.volume,
  });

  factory Trade.fromJson(Map<String, dynamic> json) => Trade(
    currentPrice: json["currentPrice"]?.toDouble(),
    comment: json["comment"],
    digits: json["digits"],
    login: json["login"],
    openPrice: json["openPrice"]?.toDouble(),
    openTime: json["openTime"] == null ? null : DateTime.parse(json["openTime"]),
    profit: json["profit"]?.toDouble(),
    sl: json["sl"]?.toDouble(),
    swaps: json["swaps"]?.toDouble(),
    symbol: json["symbol"],
    tp: json["tp"],
    ticket: json["ticket"],
    type: json["type"],
    volume: json["volume"]?.toDouble(),
  );
}
