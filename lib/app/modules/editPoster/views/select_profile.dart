import 'dart:io';

import 'package:festiva_poster/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../reusable/reusable.dart';
import '../controllers/edit_poster_controller.dart';

class SelectProfileView extends GetView<EditPosterController> {
  const SelectProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return appScaffold(
      backgroundColor: AppColors.white,
      appBar: myAppBar(titleText: LocalString.selectProfile, isBack: true),
      body: Obx(() {
        if (controller.selectProfile.isLoaded.isFalse) {
          return _loader();
        } else {
          if (controller.selectProfile.myProfiles.isNotEmpty) {
            controller.selectProfile.myProfiles.sort((a, b) {
              DateTime dateA =
                  DateTime.parse(a.dbCreatedAt ?? DateTime.now().toString());
              DateTime dateB =
                  DateTime.parse(b.dbCreatedAt ?? DateTime.now().toString());
              return dateB.compareTo(dateA);
            });
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.selectProfile.myProfiles.length,
                itemBuilder: (context, index) {
                  return Obx(() => _profileItem(index));
                });
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NoData(
                  title: LocalString.noProfile,
                  subTitle: LocalString.noSelectedProfile,
                  isButton: true,
                ),
              ],
            );
          }
        }
      }),
    );
  }

  Widget _profileItem(int index) {
    return InkWell(
      onTap: () {
        controller.selectProfile.setProfile(index);
      },
      splashColor: AppColors.trans,
      highlightColor: AppColors.trans,
      child: Container(
        height: 12.h,
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.white,
            border: controller.selectProfile.selectedIdx.value ==
                        controller.selectProfile.myProfiles[index].dbId ||
                    controller.selectProfile.selectedIdx.value == index
                ? Border.all(color: AppColors.appColor, width: 1.5)
                : Border.all(color: AppColors.black, width: 0.1)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: FileImage(File(
                          controller.selectProfile.myProfiles[index].logo ??
                              emptyString)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            controller.selectProfile.myProfiles[index].name
                                    ?.toUpperCase() ??
                                emptyString,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: poppins.w600.get10,
                          ),
                          userDataRow(
                              title: Icons.phone,
                              data: controller
                                      .selectProfile.myProfiles[index].mobile ??
                                  emptyString),
                          userDataRow(
                              title: Icons.email,
                              data: controller
                                      .selectProfile.myProfiles[index].email ??
                                  emptyString),
                          userDataRow(
                              title: Icons.business_center,
                              data: controller.selectProfile.myProfiles[index]
                                      .profileType ??
                                  emptyString),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _loader() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            10,
            (index) => SimmerLoader(
                  height: 15.h,
                  margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                )),
      ),
    );
  }

  Widget userDataRow({required IconData title, required String data}) {
    if (data.isNotEmpty || data != emptyString) {
      return Padding(
        padding: EdgeInsets.only(top: 0.4.h),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              title,
              size: 3.w,
              color: AppColors.grey,
            ),
          ),
          Expanded(
            flex: 7,
            child: AppText(
              data,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: poppins.get7.w400.grey,
            ),
          ),
        ]),
      );
    } else {
      return const Empty();
    }
  }
}
