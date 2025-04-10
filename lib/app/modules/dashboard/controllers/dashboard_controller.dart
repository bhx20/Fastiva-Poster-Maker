import 'package:festiva_poster/app/modules/home/views/home_view.dart';
import 'package:festiva_poster/app/modules/picture/views/picture_view.dart';
import 'package:festiva_poster/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../model/global.dart';

class DashboardController extends GetxController {
//==============================================================================
// ** Properties **
//==============================================================================
  var currentIndex = 2.obs;
  List<NavigationBarIcons> iconList = [
    NavigationBarIcons(
        selected: AppIcon.pictureFill, unSelected: AppIcon.picture),
    NavigationBarIcons(selected: AppIcon.likesFill, unSelected: AppIcon.likes),
    NavigationBarIcons(
        selected: AppIcon.homeFill, unSelected: AppIcon.homeFill),
    NavigationBarIcons(
        selected: AppIcon.downloadFill, unSelected: AppIcon.download),
    NavigationBarIcons(selected: AppIcon.userFill, unSelected: AppIcon.user),
  ];

//==============================================================================
// ** Life Cycle **
//==============================================================================

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      currentIndex(Get.arguments);
    }
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

  /// Dashboard screen list
  List<Widget> screenWidgets = [
    PictureView(),
    Container(),
    HomeView(),
    Container(),
    ProfileView()
  ];
}
