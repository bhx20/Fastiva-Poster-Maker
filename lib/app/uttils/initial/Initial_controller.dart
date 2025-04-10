import 'package:get/get.dart';

import '../uttils.dart';

class InitialController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    setLanguage();
    Utils.setOrientations();
    await PreferenceHelper.instance.createSharedPref();
    await DbHelper.instance.initDataBase();
  }
}
