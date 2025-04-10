import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/assets.dart';
import '../../core/colors.dart';
import '../../core/constant.dart';
import '../../core/typography.dart';
import '../reusable.dart';

AppBar myAppBar({
  Color? backGroundColor,
  Widget? content,
  Widget? titleWidget,
  Widget? leadingWidget,
  RxDouble? leadingWidth,
  bool isBack = false,
  bool isManu = false,
  bool logo = false,
  Widget? actionWidget,
  Function()? leadingTap,
  String? titleText,
  TextStyle? titleStyle,
  bool isDivider = true,
}) {
  return AppBar(
    actions: [actionWidget ?? const Empty()],
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    leading: isBack
        ? leadingWidget ??
            IconButton(
                onPressed: leadingTap ??
                    () {
                      Get.back();
                    },
                splashColor: AppColors.trans,
                highlightColor: AppColors.trans,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                  size: 2.5.h,
                ))
        : isManu
            ? leadingWidget ??
                Align(
                  child: IconButton(
                      onPressed: leadingTap,
                      icon: const Icon(
                        Icons.menu_outlined,
                        color: AppColors.black,
                      )),
                )
            : const Empty(),
    leadingWidth: leadingWidth?.value,
    title: logo
        ? DefaultImage(
            AppImage.logoHome,
            width: 11.h,
          )
        : titleWidget ??
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: AppText(titleText ?? emptyString,
                  style: titleStyle ?? poppins.w600.get10.black),
            ),
    centerTitle: true,
    bottom: isDivider
        ? PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: AppColors.appColor.withOpacity(0.2),
              height: 1.0,
            ))
        : PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: SizedBox(),
          ),
    backgroundColor: backGroundColor ?? AppColors.white,
  );
}
