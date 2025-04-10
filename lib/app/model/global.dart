import 'package:festiva_poster/app/model/response/profile_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NavigationBarIcons {
  final String unSelected;
  final String selected;

  NavigationBarIcons({
    required this.unSelected,
    required this.selected,
  });
}

class FirmData {
  final String title;
  final RxBool isSelected;

  FirmData({required this.title, required this.isSelected});
}

class ProfileTile {
  final String icon;
  final String title;
  final String route;

  ProfileTile({
    required this.icon,
    required this.title,
    required this.route,
  });
}

class MoreItem {
  final IconData icon;
  final String title;
  MoreItem({required this.icon, required this.title});
}

class ProfileArgument {
  final bool isOnBoarding;
  final bool? isPersonal;
  final bool? isEditPoster;
  final ProfileData? profileData;

  ProfileArgument({
    required this.isOnBoarding,
    this.profileData,
    this.isEditPoster,
    this.isPersonal,
  });
}

class LanguageData {
  final String title;
  final RxBool? isSelected;
  final String? leading;
  final Locale? language;
  final String? languageCode;
  final String? languageCountry;

  LanguageData({
    required this.title,
    this.isSelected,
    this.leading,
    this.language,
    this.languageCode,
    this.languageCountry,
  });
}

class PreviewIcon {
  final String icon;

  PreviewIcon({
    required this.icon,
  });
}

class DrawerItem {
  final String icon;
  final String title;

  DrawerItem({
    required this.title,
    required this.icon,
  });
}

class DownloadArgument {
  final String? imagePath;
  final bool isDownload;
  final ByteData? byte;
  DownloadArgument({
    this.imagePath,
    required this.isDownload,
    this.byte,
  });
}
