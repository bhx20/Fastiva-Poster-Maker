import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../core/core.dart';
import '../reusable.dart';

//==============================================================================
// ** Elevated Button **
//==============================================================================
class AppButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double? height;
  final double? width;
  final double? radius;
  final bool? loader;
  final Color? backGroundColor;
  final EdgeInsetsGeometry? padding;

  const AppButton(
    this.title, {
    super.key,
    required this.onPressed,
    this.height,
    this.radius,
    this.width,
    this.loader = false,
    this.backGroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 3.h, bottom: 3.h),
      child: GestureDetector(
        onTap: loader == true ? () {} : onPressed,
        child: Container(
          height: height ?? 5.5.h,
          width: width ?? Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 50),
            color: backGroundColor ?? AppColors.appColor,
          ),
          child: loader == true
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Lottie.asset(AppImage.loader),
                )
              : Center(
                  child: AppText(
                  title,
                  style: poppins.w500.get10.white.letterSpace(0.2),
                )),
        ),
      ),
    );
  }
}
