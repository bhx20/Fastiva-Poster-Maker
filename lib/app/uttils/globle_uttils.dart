import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/colors.dart';
import 'local_store/prefrances.dart';

void appPrint(dynamic str) {
  debugPrint("print value: $str");
}

class Utils {
  static setOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

setLanguage() async {
  String? savedLanguage;
  savedLanguage = await PreferenceHelper.instance.getData(Pref.setLanguage);

  /// Set up default language if none is saved
  if (savedLanguage != null) {
    Get.updateLocale(Locale(savedLanguage));
  } else {
    Get.updateLocale(const Locale('en'));
  }
}

showFastivaBottomSheet(context, Widget screen, {bool safe = true}) {
  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: false,
    useSafeArea: safe,
    useRootNavigator: true,
    context: context,
    backgroundColor: AppColors.trans,
    builder: (context) {
      return screen;
    },
  );
}

getSavedLanguage() async {
  String savedLangCode =
      await PreferenceHelper.instance.getData(Pref.setLanguage) ?? "en";
  String savedLangCountry =
      await PreferenceHelper.instance.getData(Pref.setLanguageCountry) ?? "US";
  await Get.updateLocale(Locale(savedLangCode, savedLangCountry));
}
