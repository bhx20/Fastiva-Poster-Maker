import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/colors.dart';
import 'app_widgets/app_drawer.dart';

//============================================================
// **  Scaffold **
//============================================================

Widget appScaffold({
  Key? key,
  PreferredSizeWidget? appBar,
  Widget? body,
  Widget? floatingActionButton,
  FloatingActionButtonLocation? floatingActionButtonLocation,
  FloatingActionButtonAnimator? floatingActionButtonAnimator,
  List<Widget>? persistentFooterButtons,
  AlignmentDirectional persistentFooterAlignment =
      AlignmentDirectional.centerEnd,
  Widget? drawer,
  void Function(bool)? onDrawerChanged,
  Widget? endDrawer,
  void Function(bool)? onEndDrawerChanged,
  Widget? bottomNavigationBar,
  Widget? bottomSheet,
  Color? backgroundColor,
  bool? resizeToAvoidBottomInset,
  bool primary = true,
  DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,
  bool extendBody = false,
  bool safe = true,
  bool topSafe = true,
  bool extendBodyBehindAppBar = false,
  Color? drawerScrimColor,
  Color? statusBarColor,
  Brightness? statusBarIconBrightness,
  double? drawerEdgeDragWidth,
  bool drawerEnableOpenDragGesture = false,
  bool endDrawerEnableOpenDragGesture = false,
  String? restorationId,
}) {
  return AnnotatedRegion(
    value: SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: statusBarColor ?? AppColors.white,
        systemNavigationBarColor: AppColors.white),
    child: Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: SafeArea(
        top: topSafe,
        child: Scaffold(
          key: key,
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          persistentFooterAlignment: persistentFooterAlignment,
          onDrawerChanged: onDrawerChanged,
          drawer: drawer ?? appDrawer(),
          endDrawer: endDrawer,
          onEndDrawerChanged: onEndDrawerChanged,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor ?? AppColors.appBG,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
        ),
      ),
    ),
  );
}
