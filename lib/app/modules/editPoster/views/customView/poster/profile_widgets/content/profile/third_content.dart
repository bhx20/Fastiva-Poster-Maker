import 'dart:math';

import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../reusable/reusable.dart';
import '../../../../../../controllers/edit_poster_controller.dart';

class ThirdContentView extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const ThirdContentView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var number = data.value.number;
    var email = data.value.email;
    var name = data.value.name;

    return Obx(() => Positioned(
          left: name?.fixBottom.value,
          child: GestureDetector(
            onPanUpdate: (details) {
              name?.fixBottom.value =
                  max(0, name.fixBottom.value + details.delta.dx);
            },
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameView(name),
                    numberView(number),
                    emailView(email),
                  ],
                )),
          ),
        ));
  }

  Widget nameView(NameDraft? name) {
    return controller.selectProfile.editObject.value.mobile != null
        ? name!.preview.isTrue
            ? InkWell(
                onTap: () {
                  controller.toolType(ToolRoutes.name);
                },
                child: AppText(
                  " ${controller.selectProfile.editObject.value.name ?? emptyString}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontFamily: name.textFont.font.value)
                      .textColor(name.toolColor.color.value
                          .withOpacity(name.toolColor.opacity.value))
                      .size(name.textSize.size.value)
                      .letterSpace(name.textSpace.space.value)
                      .w600,
                ),
              )
            : const Empty()
        : const Empty();
  }

  Widget numberView(NumberDraft? number) {
    return controller.selectProfile.editObject.value.mobile != null
        ? number!.preview.isTrue
            ? InkWell(
                onTap: () {
                  controller.toolType(ToolRoutes.number);
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.2.w),
                      child: Image.asset(AppIcon.mobile,
                          height: number.textSize.size.value,
                          width: number.textSize.size.value),
                    ),
                    AppText(
                      " ${controller.selectProfile.editObject.value.mobile ?? emptyString}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontFamily: number.textFont.font.value)
                          .textColor(number.toolColor.color.value
                              .withOpacity(number.toolColor.opacity.value))
                          .size(number.textSize.size.value)
                          .letterSpace(number.textSpace.space.value),
                    ),
                  ],
                ),
              )
            : const Empty()
        : const Empty();
  }

  Widget emailView(EmailDraft? email) {
    return controller.selectProfile.editObject.value.email != null
        ? email!.preview.isTrue
            ? InkWell(
                onTap: () {
                  controller.toolType(ToolRoutes.email);
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.2.w),
                      child: Image.asset(AppIcon.mail,
                          height: email.textSize.size.value,
                          width: email.textSize.size.value),
                    ),
                    AppText(
                      " ${controller.selectProfile.editObject.value.email ?? emptyString}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontFamily: email.textFont.font.value)
                          .textColor(email.toolColor.color.value
                              .withOpacity(email.toolColor.opacity.value))
                          .size(email.textSize.size.value)
                          .letterSpace(email.textSpace.space.value),
                    ),
                  ],
                ),
              )
            : const Empty()
        : const Empty();
  }
}
