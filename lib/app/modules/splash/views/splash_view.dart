import 'package:festiva_poster/app/core/assets.dart';
import 'package:festiva_poster/app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../reusable/animations/fade_widget.dart';
import '../../../reusable/reusable.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Get.put(SplashController()).redirect();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.trans,
          systemNavigationBarColor: AppColors.white),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
            height: Get.height,
            child: FadeWidget(
                child: DefaultImage(AppImage.splash, fit: BoxFit.fitHeight))),
      ),
    );
  }
}
