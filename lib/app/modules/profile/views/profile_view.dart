import 'dart:io';

import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/model/response/profile_data_model.dart';
import 'package:festiva_poster/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:festiva_poster/app/modules/download/controllers/download_controller.dart';
import 'package:festiva_poster/app/modules/likes/controllers/likes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../model/global.dart';
import '../../../reusable/reusable.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  @override
  void initState() {
    Get.put(ProfileController());
    super.initState();
  }

  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        builder: (controller) => CheckConnection(
              title: LocalString.profile,
              child: appScaffold(
                appBar: myAppBar(
                    titleText: LocalString.profile,
                    isManu: true,
                    leadingTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    isDivider: false),
                body: SizedBox(
                    width: Get.width,
                    child: Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border(
                                bottom: BorderSide(
                              color: AppColors.appColor.withOpacity(0.2),
                            )),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20)),
                          ),
                          child: Center(
                            child: Obx(() {
                              if (controller.businessProfileList.isNotEmpty) {
                                return _logoView(
                                    controller.businessProfileList);
                              } else {
                                return _logoView(
                                    controller.personalProfileList);
                              }
                            }),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                        controller.profileTileList.length,
                                        (index) => InkWell(
                                          onTap: () {
                                            if (index == 0 || index == 1) {
                                              Get.toNamed(controller
                                                  .profileTileList[index]
                                                  .route);
                                            } else if (index == 2) {
                                              controller.share();
                                            } else if (index == 3) {
                                              controller.privacy();
                                            } else if (index == 4) {
                                              controller.term();
                                            } else if (index == 5) {
                                              controller.rate();
                                            } else if (index == 6) {
                                              controller.help();
                                            }
                                          },
                                          splashColor: AppColors.trans,
                                          highlightColor: AppColors.trans,
                                          child: Container(
                                            width: Get.width,
                                            height: 7.h,
                                            margin:
                                                EdgeInsets.only(bottom: 1.h),
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  color: AppColors.grey
                                                      .withOpacity(0.2),
                                                )),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(0.6.h),
                                                  padding:
                                                      EdgeInsets.all(1.7.h),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.appColor
                                                        .withOpacity(.08),
                                                  ),
                                                  child: Image.asset(
                                                    controller
                                                        .profileTileList[index]
                                                        .icon,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AppText(
                                                          controller
                                                              .profileTileList[
                                                                  index]
                                                              .title,
                                                          style: poppins
                                                              .get9.w500.black),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 1.h),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios_sharp,
                                                          size: 2.h,
                                                          color: AppColors.grey,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ));
  }

//==============================================================================
  Widget _logoView(RxList<ProfileData> profileData) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Container(
              height: 14.h,
              width: 14.h,
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
          if (profileData.isNotEmpty) ...[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0.2.h),
                      child: AppText(
                        profileData.first.name ?? emptyString,
                        style: poppins.get12.w900.black,
                      ),
                    ),
                    AppText(
                      profileData.first.email ?? emptyString,
                      style: poppins.get7.grey,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Get.find<DashboardController>().currentIndex(1);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      LocalString.likes,
                                      style: poppins.get9.bold.black,
                                    ),
                                    Obx(
                                      () => AppText(
                                        "${Get.put(LikesController()).totalLikes}",
                                        style: poppins.get10.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Get.find<DashboardController>().currentIndex(3);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      LocalString.download,
                                      style: poppins.get9.bold.black,
                                    ),
                                    Obx(
                                      () => AppText(
                                        "${Get.put(DownloadController()).paginatedDownloadList.length}",
                                        style: poppins.get10.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
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
    );
  }
}
