import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/core.dart';
import '../../model/global.dart';
import '../../model/response/profile_data_model.dart';
import '../../modules/profile/controllers/profile_controller.dart';
import '../../routes/app_pages.dart';
import '../reusable.dart';

Drawer appDrawer() {
  return const Drawer(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    backgroundColor: AppColors.white,
    child: DrawerWidget(),
  );
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController(),
        builder: (controller) {
          return Container(
            color: AppColors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (controller.businessProfileList.isNotEmpty) {
                      return _logoView(controller.businessProfileList);
                    } else {
                      return _logoView(controller.personalProfileList);
                    }
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Column(
                      children: List.generate(
                          controller.drawerItem.length,
                          (index) => InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Get.toNamed(Routes.POSTER_PROFILES);
                                  }
                                  if (index == 1) {
                                    controller.privacy();
                                  }
                                  if (index == 2) {
                                    controller.term();
                                  }
                                  if (index == 3) {
                                    controller.rate();
                                  }
                                  if (index == 4) {
                                    controller.share();
                                  }
                                  if (index == 5) {
                                    controller.help();
                                  }
                                  if (index == 6) {
                                    AppDialogs.warning(
                                      context,
                                      content: LocalString.exitWarning,
                                    );
                                  }
                                },
                                splashColor: AppColors.trans,
                                highlightColor: AppColors.trans,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w),
                                              child: DefaultImage(
                                                controller
                                                    .drawerItem[index].icon,
                                                width: 2.5.h,
                                                height: 2.5.h,
                                              ),
                                            ),
                                            AppText(
                                              controller
                                                  .drawerItem[index].title,
                                              style: poppins.w600.get9,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.5.w),
                                        child: Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.05),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _logoView(RxList<ProfileData> profileData) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.POSTER_PROFILES);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Container(
                height: 7.h,
                width: 7.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: profileData.isNotEmpty
                      ? DecorationImage(
                          image: FileImage(
                              File(profileData.first.logo ?? emptyString)),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage(AppIcon.placeholder),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 2.w, bottom: 0.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (profileData.isNotEmpty) ...[
                      AppText(
                        profileData.first.name?.toUpperCase() ?? emptyString,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: poppins.get11.w900.black,
                      ),
                      AppText(
                        profileData.first.email ?? emptyString,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: poppins.get6.w500.grey,
                      ),
                    ] else ...[
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.ADD_PROFILE,
                                arguments: ProfileArgument(
                                  isOnBoarding: false,
                                ));
                          },
                          child: AppText(LocalString.addProfile))
                    ]
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
