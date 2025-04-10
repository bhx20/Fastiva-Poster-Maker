import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/reusable/animations/delay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../reusable/reusable.dart';
import '../../../routes/app_pages.dart';
import '../../../uttils/uttils.dart';
import '../controllers/addProfile_controller.dart';

class AddProfileView extends StatelessWidget {
  const AddProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddProfileController(),
        builder: (controller) {
          return appScaffold(
            appBar: myAppBar(
                titleText: controller.argData.profileData != null
                    ? LocalString.updateProfile
                    : LocalString.addProfile,
                actionWidget: controller.argData.isOnBoarding == true
                    ? IconButton(
                        onPressed: () async {
                          await PreferenceHelper.instance
                              .setData(Pref.firstLunch, false);
                          Get.offAllNamed(Routes.DASHBOARD);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 3.h,
                        ))
                    : const Empty(),
                isBack: controller.argData.isOnBoarding == true ? false : true),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: SizedBox(
                  width: Get.width,
                  child: DelayedWidget(
                    from: DelayFrom.bottom,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                SizedBox(
                                  height: 18.h,
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: Obx(() {
                                      if (controller
                                          .croppedFilePath.isNotEmpty) {
                                        return _imageView(controller);
                                      } else {
                                        return _uploadView(context, controller);
                                      }
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _profileTypeView(controller),
                          AppTextFormField(
                            label: LocalString.name,
                            controller: controller.nameController,
                            validate: Validators.nameValidator.call,
                          ),
                          AppTextFormField(
                            label: LocalString.mobileNumber,
                            controller: controller.mobileController,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            validate: Validators.numberValidator.call,
                          ),
                          AppTextFormField(
                            label: LocalString.emailAddress,
                            controller: controller.emailController,
                            validate: Validators.emailValidator.call,
                          ),
                          AppTextFormField(
                            label: LocalString.address,
                            controller: controller.addressController,
                            maxLength: 60,
                            isCounter: true,
                            validate: Validators.addressValidator.call,
                          ),
                          Obx(
                            () => AppButton(
                              controller.argData.profileData != null
                                  ? LocalString.update
                                  : LocalString.save,
                              loader: controller.loader.value,
                              onPressed: () {
                                controller.continueTap();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

//==============================================================================
// ** Helper Widgets **
//==============================================================================

  Widget _profileTypeView(AddProfileController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: AppText(
              LocalString.selectType,
              style: poppins.get9.black.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              controller.firmData.length,
              (index) => InkWell(
                onTap: () async {
                  controller.manageProfileIndex(index);
                },
                child: Obx(() => Container(
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: controller.firmData[index].isSelected.isTrue
                              ? AppColors.appColor
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.grey.withOpacity(0.2),
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.2.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(controller.firmData[index].title,
                                style: poppins.get9.w600.textColor(
                                  controller.firmData[index].isSelected.isTrue
                                      ? AppColors.white
                                      : AppColors.appColor,
                                ))
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uploadView(BuildContext context, AddProfileController controller) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(100),
      dashPattern: const [8, 8],
      color: AppColors.appColor,
      strokeWidth: 2,
      child: InkWell(
        onTap: () {
          controller.uploadImage(context);
        },
        splashColor: AppColors.trans,
        child: Container(
          width: Get.width,
          margin: EdgeInsets.all(0.5.h),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.2,
                child: DefaultImage(
                  AppIcon.upload,
                  width: 8.w,
                  color: AppColors.appColor.withOpacity(0.5),
                ),
              ),
              Opacity(
                opacity: 0.2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  child: AppText(
                    LocalString.uploadLogo,
                    style: poppins.appColor.w600.get8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageView(AddProfileController controller) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(100),
      dashPattern: const [8, 8],
      color: AppColors.appColor,
      strokeWidth: 2,
      child: Padding(
        padding: EdgeInsets.all(0.5.h),
        child: Stack(
          children: [
            ClipOval(
              child: Image.file(File(controller.croppedFilePath.value)),
            ),
            _closeView(controller)
          ],
        ),
      ),
    );
  }

  Widget _closeView(AddProfileController controller) {
    return Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            controller.eraseFile();
          },
          child: Container(
            padding: EdgeInsets.all(2.8.h),
            decoration: const BoxDecoration(
                color: AppColors.red,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100))),
            child: Icon(
              Icons.delete,
              color: AppColors.white,
              size: 2.5.h,
            ),
          ),
        ));
  }
}
