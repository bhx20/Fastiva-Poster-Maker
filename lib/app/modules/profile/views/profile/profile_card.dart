import 'dart:io';

import 'package:festiva_poster/app/reusable/globle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/global.dart';
import '../../../../model/response/profile_data_model.dart';
import '../../../../reusable/dialogs/app_dialogs.dart';
import '../../../../reusable/manu/action_manu.dart';
import '../../../../routes/app_pages.dart';
import '../../../../uttils/local_store/prefrances.dart';
import '../../controllers/profile_controller.dart';

class ProfileCard extends GetView<ProfileController> {
  final RxList<ProfileData> profileList;
  final RxBool isLoaded;
  final bool isPersonal;
  const ProfileCard({
    Key? key,
    required this.profileList,
    required this.isLoaded,
    required this.isPersonal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoaded.isFalse) {
        return _loader();
      } else {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: profileList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 10.h,
                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    border: Border.all(color: AppColors.black, width: 0.1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(
                                  File(profileList[index].logo ?? emptyString)),
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
                                    profileList[index].name?.toUpperCase() ??
                                        emptyString,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.w600.get10,
                                  ),
                                  userDataRow(
                                      title: Icons.phone,
                                      data: profileList[index].mobile ??
                                          emptyString),
                                  userDataRow(
                                      title: Icons.email,
                                      data: profileList[index].email ??
                                          emptyString),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    IconButton(
                        key: profileList[index].menuKey,
                        onPressed: () {
                          showActionManu(
                              profileList[index].menuKey ?? GlobalKey(),
                              onEdit: () {
                            Get.toNamed(Routes.ADD_PROFILE,
                                arguments: ProfileArgument(
                                    isOnBoarding: false,
                                    profileData: profileList[index],
                                    isPersonal:
                                        isPersonal == true ? true : false));
                          }, onDelete: () {
                            AppDialogs.warning(context,
                                content: LocalString.profileWarning,
                                actionTap: () async {
                              int id = await PreferenceHelper.instance.getData(
                                Pref.selectProfile,
                              );
                              if (id == profileList[index].dbId) {
                                await PreferenceHelper.instance
                                    .setData(Pref.selectProfile, 0);
                              }
                              controller.deleteProfileCard(
                                  profileList[index].dbId ?? 0,
                                  profileList[index].logo ?? emptyString);
                              Get.back();
                            });
                          });
                        },
                        icon: Icon(Icons.more_vert_outlined)),
                  ],
                ),
              );
            });
      }
    });
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
