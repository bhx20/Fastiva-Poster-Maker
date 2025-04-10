import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/core.dart';
import '../../../reusable/reusable.dart';
import '../controllers/profile_controller.dart';

class LanguagesView extends GetView<ProfileController> {
  const LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return appScaffold(
      appBar: myAppBar(titleText: LocalString.languages, isBack: true),
      bottomNavigationBar: Obx(() => Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: AppButton(
                padding: EdgeInsets.only(bottom: 1.h),
                loader: controller.isUpdateLoaded.value,
                LocalString.continueButton, onPressed: () {
              controller.updateLanguage();
            }),
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
          child: ListView.builder(
              itemCount: controller.languageList.length,
              itemBuilder: (context, index) {
                RxBool selected = controller.languageList[index].isSelected!;
                return Obx(() => InkWell(
                      onTap: () {
                        controller.manageProfileIndex(index);
                      },
                      splashColor: AppColors.trans,
                      highlightColor: AppColors.trans,
                      child: Container(
                        width: Get.width,
                        height: 7.h,
                        margin: EdgeInsets.only(bottom: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: selected.isTrue
                                  ? AppColors.appColor
                                  : AppColors.grey.withOpacity(0.2),
                            )),
                        child: Row(
                          children: [
                            Container(
                              width: 10.w,
                              margin: EdgeInsets.all(1.h),
                              decoration: BoxDecoration(
                                  color: AppColors.appColor.withOpacity(.08),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: AppText(
                                  controller.languageList[index].leading ??
                                      emptyString,
                                  style: poppins.get12.w900.black,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(controller.languageList[index].title,
                                      style: poppins.get10.black),
                                  Padding(
                                    padding: EdgeInsets.only(right: 1.h),
                                    child: Icon(
                                      selected.isTrue
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_off,
                                      size: 2.5.h,
                                      color: selected.isTrue
                                          ? AppColors.appColor
                                          : AppColors.grey,
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    ));
              })),
    );
  }
}
