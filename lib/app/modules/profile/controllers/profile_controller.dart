import 'dart:convert';
import 'dart:io';

import 'package:festiva_poster/app/core/assets.dart';
import 'package:festiva_poster/app/model/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/local_string.dart';
import '../../../core/string.dart';
import '../../../model/response/profile_data_model.dart';
import '../../../routes/app_pages.dart';
import '../../../uttils/uttils.dart';

class ProfileController extends GetxController {
//==============================================================================
// ** Properties **
//==============================================================================
  var profileLoaded = false.obs;
  int? languagesIndex;
  var isUpdateLoaded = false.obs;
  final dbHelper = DbHelper.instance;
  RxList<ProfileData> myProfiles = <ProfileData>[].obs;
  RxList<ProfileData> personalProfileList = <ProfileData>[].obs;
  RxList<ProfileData> businessProfileList = <ProfileData>[].obs;
  List<ProfileTile> profileTileList = [
    ProfileTile(
      icon: AppIcon.user,
      title: LocalString.myProfileList,
      route: Routes.POSTER_PROFILES,
    ),
    ProfileTile(
      icon: AppIcon.world,
      title: LocalString.languages,
      route: Routes.LANGUAGES_VIEW,
    ),
    ProfileTile(
      icon: AppIcon.share,
      title: LocalString.share,
      route: "",
    ),
    ProfileTile(
      icon: AppIcon.privacy,
      title: LocalString.privacy,
      route: "",
    ),
    ProfileTile(
      icon: AppIcon.term,
      title: LocalString.termsAndConditions,
      route: "",
    ),
    ProfileTile(
      icon: AppIcon.star,
      title: LocalString.rateMyApp,
      route: "",
    ),
    ProfileTile(
      icon: AppIcon.help,
      title: LocalString.help,
      route: "",
    ),
  ];

  List<MoreItem> items = [
    MoreItem(
      icon: Icons.edit,
      title: "Edit",
    ),
    MoreItem(
      icon: Icons.delete,
      title: "Delete",
    ),
  ];

  List<LanguageData> languageList = [
    LanguageData(
      leading: LocalString.e,
      title: LocalString.english,
      isSelected: false.obs,
      language: const Locale('en', 'US'),
      languageCode: 'en',
      languageCountry: 'US',
    ),
    LanguageData(
        leading: LocalString.h,
        title: LocalString.hindi,
        isSelected: false.obs,
        language: const Locale('hi', 'IN'),
        languageCode: 'hi',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.tm,
        title: LocalString.tamil,
        isSelected: false.obs,
        language: const Locale('ta', 'IN'),
        languageCode: 'ta',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.t,
        title: LocalString.telugu,
        isSelected: false.obs,
        language: const Locale('te', 'IN'),
        languageCode: 'te',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.bn,
        title: LocalString.bengali,
        isSelected: false.obs,
        language: const Locale('bg', 'BD'),
        languageCode: 'bg',
        languageCountry: 'BD'),
    LanguageData(
        leading: LocalString.m,
        title: LocalString.marathi,
        isSelected: false.obs,
        language: const Locale('mr', 'IN'),
        languageCode: 'mr',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.g,
        title: LocalString.gujarati,
        isSelected: false.obs,
        language: const Locale('gu', 'IN'),
        languageCode: 'gu',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.kn,
        title: LocalString.kanada,
        isSelected: false.obs,
        language: const Locale('kn', 'IN'),
        languageCode: 'kn',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.ml,
        title: LocalString.malayalam,
        isSelected: false.obs,
        language: const Locale('ml', 'IN'),
        languageCode: 'ml',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.pn,
        title: LocalString.panjabi,
        isSelected: false.obs,
        language: const Locale('pa', 'IN'),
        languageCode: 'pa',
        languageCountry: 'IN'),
    LanguageData(
        leading: LocalString.ur,
        title: LocalString.urdu,
        isSelected: false.obs,
        language: const Locale('ur', 'PK'),
        languageCode: 'ur_PK',
        languageCountry: 'PK'),
    LanguageData(
        leading: LocalString.od,
        title: LocalString.odia,
        isSelected: false.obs,
        language: const Locale('or', 'IN'),
        languageCode: 'or',
        languageCountry: 'IN'),
  ];

//==============================================================================
// ** Life Cycle **
//==============================================================================

  @override
  void onInit() {
    super.onInit();
    getProfileList();
    setLanguagesIndex();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

//==============================================================================
// ** Functions **
//==============================================================================

  /// Manage profile type
  manageProfileIndex(int index) {
    for (var data in languageList) {
      data.isSelected!(false);
    }
    languagesIndex = index;
    languageList[index].isSelected!(true);
  }

  /// Delete Images From Directory
  void deleteFile(String filePath) {
    File file = File(filePath);
    if (file.existsSync()) {
      file.deleteSync();
    }
  }

  Future<void> getProfileList() async {
    profileLoaded(false);
    var cardData = await dbHelper.queryAll(SqlTableString.profileData);
    String profileDataJson = jsonEncode(cardData);
    List<ProfileData> profileList = profileDataFromJson(profileDataJson);

    myProfiles.value = profileList;

    /// get personal profile
    personalProfileList.value = profileList
        .where((element) => element.profileType == LocalString.personal)
        .toList();
    personalProfileList.sort((a, b) {
      DateTime dateA =
          DateTime.parse(a.dbCreatedAt ?? DateTime.now().toString());
      DateTime dateB =
          DateTime.parse(b.dbCreatedAt ?? DateTime.now().toString());
      return dateA.compareTo(dateB);
    });
    personalProfileList.value = personalProfileList.reversed.toList();

    /// get business profile
    businessProfileList.value = profileList
        .where((element) => element.profileType == LocalString.business)
        .toList();
    businessProfileList.sort((a, b) {
      DateTime dateA =
          DateTime.parse(a.dbCreatedAt ?? DateTime.now().toString());
      DateTime dateB =
          DateTime.parse(b.dbCreatedAt ?? DateTime.now().toString());
      return dateA.compareTo(dateB);
    });
    businessProfileList.value = businessProfileList.reversed.toList();
    profileLoaded(true);
  }

  /// delete profile data
  Future<void> deleteProfileCard(int id, String imagePath) async {
    deleteFile(imagePath);
    await dbHelper
        .deleteQuery(SqlTableString.profileData, id, SqlTableString.dbId)
        .then((value) => getProfileList());
  }

  /// update languages
  updateLanguage() async {
    isUpdateLoaded(true);
    await Future.delayed(const Duration(milliseconds: 300)).then((value) async {
      await Get.updateLocale(languageList[languagesIndex ?? 0].language!);
      await PreferenceHelper.instance
          .setData(Pref.setLanguageIndex, languagesIndex ?? 0);

      await PreferenceHelper.instance.setData(
          Pref.setLanguage, languageList[languagesIndex ?? 0].languageCode);
      await PreferenceHelper.instance.setData(Pref.setLanguageCountry,
          languageList[languagesIndex ?? 0].languageCountry);

      Get.back();
    });
    isUpdateLoaded(false);
  }

  /// set current language index
  setLanguagesIndex() async {
    languagesIndex =
        await PreferenceHelper.instance.getData(Pref.setLanguageIndex);
    appPrint(languagesIndex ?? 0);
    for (var data in languageList) {
      data.isSelected!(false);
    }
    languageList[languagesIndex ?? 0].isSelected!(true);
  }

//==============================================================================
// ** Drawer Functions **
//==============================================================================

  List<DrawerItem> drawerItem = [
    DrawerItem(title: LocalString.myProfile, icon: AppIcon.user),
    DrawerItem(title: LocalString.privacy, icon: AppIcon.privacy),
    DrawerItem(title: LocalString.termsAndConditions, icon: AppIcon.term),
    DrawerItem(title: LocalString.rateMyApp, icon: AppIcon.star),
    DrawerItem(title: LocalString.share, icon: AppIcon.share),
    DrawerItem(title: LocalString.help, icon: AppIcon.help),
    DrawerItem(title: LocalString.exit, icon: AppIcon.exit),
  ];

  privacy() async {
    final Uri url = Uri.parse('http://flyer.psktechnology.com/Policy.html');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  term() async {
    final Uri url = Uri.parse('http://flyer.psktechnology.com/Terms.html');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  rate() {}

  share() {
    if (Platform.isAndroid) {
      Share.share(
          '🎨 Create Stunning Posters Instantly! 🚀 Unleash your '
          'creativity with the Fastiva Poster Maker app. Design eye-catching'
          ' posters effortlessly and share your message in style. Try it now '
          'and let your imagination soar! ✨ #FastivaPosterMaker #DesignMagic '
          'https://play.google.com/store/apps/details?id=com.app.fastiva',
          subject: 'Look what I made!');
    } else {
      Share.share(
          '🎨 Create Stunning Posters Instantly! 🚀 Unleash your '
          'creativity with the Fastiva Poster Maker app. Design eye-catching'
          ' posters effortlessly and share your message in style. Try it now '
          'and let your imagination soar! ✨ #FastivaPosterMaker #DesignMagic '
          'https://apps.apple.com/us/app/fastiva-poster-&-flyer-maker/id6476674135',
          subject: 'Look what I made!');
    }
  }

  void help() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'coddynet@gmail.com',
    );
    urlLauncher(params);
  }

  Future<void> urlLauncher(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
      );
    }
  }
}
