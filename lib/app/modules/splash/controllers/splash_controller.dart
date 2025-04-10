import 'package:get/get.dart';

import '../../../model/global.dart';
import '../../../routes/app_pages.dart';
import '../../../uttils/local_store/prefrances.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    redirect();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  redirect() {
    bool? firstLunch;
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      firstLunch = await PreferenceHelper.instance.getData(Pref.firstLunch);
      firstLunch == null
          ? Get.offAllNamed(Routes.ADD_PROFILE,
              arguments: ProfileArgument(isOnBoarding: true))
          : Get.offAllNamed(Routes.DASHBOARD);
    });
  }
}
