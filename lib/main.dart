import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/core/local_string.dart';
import 'app/core/material_theme.dart';
import 'app/reusable/scroll_behavior/scroll_behavior.dart';
import 'app/routes/app_pages.dart';
import 'app/uttils/globle_uttils.dart';
import 'app/uttils/initial/initial_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getSavedLanguage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ConnectivityAppWrapper(
          app: GetMaterialApp(
            title: LocalString.title,
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehavior(),
            translations: Local(),
            defaultTransition: Transition.rightToLeftWithFade,
            locale: Get.locale,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: customTheme,
            initialBinding: InitialBinding(),
          ),
        );
      },
    );
  }
}
