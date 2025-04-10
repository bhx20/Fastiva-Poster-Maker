// To parse this JSON data, do
//
//     final configData = configDataFromJson(jsonString);

import 'dart:convert';

ConfigData configDataFromJson(String str) =>
    ConfigData.fromJson(json.decode(str));

class ConfigData {
  String? alertTopic;
  String? appOpenId;
  String? bannerId;
  int interstitialCounter;
  String? interstitialId;
  String? iosAppOpenId;
  String? iosBannerId;
  int iosInterstitialCounter;
  String? iosInterstitialId;
  String? iosNativeId;
  String? iosRewardedId;
  bool? iosShowAd;
  bool? iosShowBanner;
  bool? iosShowInterstitial;
  bool? iosShowNative;
  bool? iosShowOpenApp;
  bool? iosShowRewarded;
  bool? isComingSoon;
  bool? isQureka;
  String? nativeId;
  String? rewardedId;
  String? inAppPoster;
  String? iOSinAppPoster;
  bool? showAd;
  bool? showBanner;
  bool? showInterstitial;
  bool? showNative;
  bool? showOpenApp;
  bool? showRewarded;
  bool? iosIsPro;
  bool? isPro;
  int nativeCounter;
  int iosNativeCounter;

  ConfigData({
    this.alertTopic,
    this.appOpenId,
    this.bannerId,
    this.interstitialCounter = 0,
    this.interstitialId,
    this.iosAppOpenId,
    this.iosBannerId,
    this.iosInterstitialCounter = 0,
    this.iosInterstitialId,
    this.iosNativeId,
    this.iosRewardedId,
    this.iosShowAd,
    this.inAppPoster,
    this.iOSinAppPoster,
    this.iosShowBanner,
    this.iosShowInterstitial,
    this.iosShowNative,
    this.iosShowOpenApp,
    this.iosIsPro,
    this.isPro,
    this.iosShowRewarded,
    this.isComingSoon,
    this.isQureka,
    this.nativeId,
    this.rewardedId,
    this.showAd,
    this.showBanner,
    this.showInterstitial,
    this.showNative,
    this.showOpenApp,
    this.showRewarded,
    this.nativeCounter = 0,
    this.iosNativeCounter = 0,
  });

  factory ConfigData.fromJson(Map<String, dynamic> json) => ConfigData(
        alertTopic: json["alertTopic"],
        appOpenId: json["appOpenId"],
        bannerId: json["bannerId"],
        inAppPoster: json["inapp_poster"],
        iOSinAppPoster: json["ios_inapp_poster"],
        interstitialCounter: json["interstitialCounter"],
        interstitialId: json["interstitialId"],
        iosAppOpenId: json["ios_appOpenId"],
        iosBannerId: json["ios_bannerId"],
        iosInterstitialCounter: json["ios_interstitialCounter"],
        iosInterstitialId: json["ios_interstitialId"],
        iosNativeId: json["ios_nativeId"],
        iosRewardedId: json["ios_rewardedId"],
        iosShowAd: json["ios_showAd"],
        iosShowBanner: json["ios_showBanner"],
        iosShowInterstitial: json["ios_showInterstitial"],
        iosShowNative: json["ios_showNative"],
        iosShowOpenApp: json["ios_showOpenApp"],
        iosShowRewarded: json["ios_showRewarded"],
        isComingSoon: json["isComingSoon"],
        isQureka: json["isQureka"],
        nativeId: json["nativeId"],
        nativeCounter: json["nativeCounter"],
        rewardedId: json["rewardedId"],
        showAd: json["showAd"],
        showBanner: json["showBanner"],
        showInterstitial: json["showInterstitial"],
        showNative: json["showNative"],
        showOpenApp: json["showOpenApp"],
        showRewarded: json["showRewarded"],
        iosIsPro: json["ios_isPro"],
        isPro: json["isPro"],
        iosNativeCounter: json["iosNativeCounter"],
      );
}
