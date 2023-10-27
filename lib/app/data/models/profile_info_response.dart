import 'dart:convert';

ProfileInfoResponse profileInfoResponseFromJson(Map<String, dynamic> map) => ProfileInfoResponse.fromJson(map);

class ProfileInfoResponse {
  String? address;
  double? balance;
  String? city;
  String? country;
  int? currency;
  int? currentTradesCount;
  double? currentTradesVolume;
  double? equity;
  double? freeMargin;
  bool? isAnyOpenTrades;
  bool? isSwapFree;
  int? leverage;
  String? name;
  String? phone;
  int? totalTradesCount;
  double? totalTradesVolume;
  int? type;
  int? verificationLevel;
  String? zipCode;

  ProfileInfoResponse({
    this.address,
    this.balance,
    this.city,
    this.country,
    this.currency,
    this.currentTradesCount,
    this.currentTradesVolume,
    this.equity,
    this.freeMargin,
    this.isAnyOpenTrades,
    this.isSwapFree,
    this.leverage,
    this.name,
    this.phone,
    this.totalTradesCount,
    this.totalTradesVolume,
    this.type,
    this.verificationLevel,
    this.zipCode,
  });

  factory ProfileInfoResponse.fromJson(Map<String, dynamic> json) => ProfileInfoResponse(
    address: json["address"],
    balance: json["balance"]?.toDouble(),
    city: json["city"],
    country: json["country"],
    currency: json["currency"],
    currentTradesCount: json["currentTradesCount"],
    currentTradesVolume: json["currentTradesVolume"]?.toDouble(),
    equity: json["equity"]?.toDouble(),
    freeMargin: json["freeMargin"]?.toDouble(),
    isAnyOpenTrades: json["isAnyOpenTrades"],
    isSwapFree: json["isSwapFree"],
    leverage: json["leverage"],
    name: json["name"],
    phone: json["phone"],
    totalTradesCount: json["totalTradesCount"],
    totalTradesVolume: json["totalTradesVolume"]?.toDouble(),
    type: json["type"],
    verificationLevel: json["verificationLevel"],
    zipCode: json["zipCode"],
  );
}
