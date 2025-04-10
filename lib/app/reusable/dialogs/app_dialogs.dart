import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/core.dart';
import '../../model/global.dart';
import '../../routes/app_pages.dart';
import '../reusable.dart';

class AppDialogs {
//==============================================================================
// ** Warning Dialog **
//==============================================================================

  static warning(BuildContext context,
      {String? content, Function()? actionTap}) {
    return showDialog(
      context: context,
      barrierColor: null,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Dialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: AppColors.white,
            ),
            padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 3.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: AppText(
                    content ?? emptyString,
                    textAlign: TextAlign.center,
                    style: poppins.w600.black.get9,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: AppButton(LocalString.yes,
                            onPressed: actionTap ?? () {}, height: 5.h),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: AppButton(
                            LocalString.no,
                            onPressed: () {
                              Get.back();
                            },
                            height: 5.h,
                            backGroundColor: AppColors.grey.withOpacity(0.5),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//==============================================================================
// ** Add Profile Dialog **
//==============================================================================

  static showAddProfile(BuildContext context, {String? content, bool? isEdit}) {
    showDialog(
      context: context,
      barrierColor: null,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            backgroundColor: AppColors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: AppColors.white,
              ),
              padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 3.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: AppText(
                      content ?? LocalString.addProfileWarning,
                      textAlign: TextAlign.center,
                      style: poppins.w500.black.get9,
                    ),
                  ),
                  AppButton(LocalString.addProfile, onPressed: () {
                    Get.back();
                    Get.toNamed(Routes.ADD_PROFILE,
                        arguments: ProfileArgument(
                            isOnBoarding: false, isEditPoster: isEdit));
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
