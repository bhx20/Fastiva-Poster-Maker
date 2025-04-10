import 'package:festiva_poster/app/reusable/reusable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/core.dart';
import '../../model/global.dart';
import '../../routes/app_pages.dart';

class NoData extends StatelessWidget {
  final String? logo;
  final String? title;
  final String? subTitle;
  final String? buttonText;
  final Function()? buttonTap;
  final bool? isButton;

  const NoData(
      {super.key,
      this.logo,
      this.title,
      this.subTitle,
      this.buttonText,
      this.buttonTap,
      this.isButton = false});

  @override
  Widget build(BuildContext context) {
    return appScaffold(
      body: Container(
        width: Get.width,
        color: AppColors.appBG,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.5,
              child: DefaultImage(
                logo ?? AppIcon.noBox,
                width: 12.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
              child: AppText(
                title ?? LocalString.noData,
                style: poppins.get15.grey.w600.space09,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
              ),
              child: AppText(
                subTitle ?? LocalString.noProfileDes,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: poppins.get7.black.w400.space09,
              ),
            ),
            if (isButton == true)
              AppButton(buttonText ?? LocalString.addProfile,
                  width: 40.w,
                  onPressed: buttonTap ??
                      () {
                        Get.toNamed(Routes.ADD_PROFILE,
                            arguments: ProfileArgument(isOnBoarding: false));
                      })
          ],
        ),
      ),
    );
  }
}

class NoDataSlider extends StatelessWidget {
  const NoDataSlider({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt currantIndex = 0.obs;
    return Material(
      child: Container(
          color: AppColors.appBG,
          width: Get.width,
          child: Obx(
            () => CarouselSliderWidget(
              itemCount: 3,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
                int pageViewIndex,
              ) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: DefaultImage(
                        AppIcon.noBox,
                        height: 12.h,
                        width: 12.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 1.h,
                      ),
                      child: AppText(
                        LocalString.noSliderData,
                        style: poppins.get9.grey.w600.space09,
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (index, reason) {
                currantIndex(index);
              },
              carouselHeight: 20.h,
              enableInfiniteScroll: true,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              autoPlay: false,
              currentIndex: currantIndex.value,
            ),
          )),
    );
  }
}

class NoConnection extends StatelessWidget {
  final String title;
  const NoConnection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return appScaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar(
            titleText: title, logo: title == LocalString.home ? true : false),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultImage(
              AppIcon.noInternet,
              width: 15.h,
              color: AppColors.grey.withOpacity(0.15),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
              child: AppText(
                LocalString.noInternet,
                style: poppins.get20.grey.w600.space09,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
              child: AppText(
                LocalString.connectionIntro,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: poppins.get8.black.w400.space09,
              ),
            ),
          ],
        ));
  }
}
