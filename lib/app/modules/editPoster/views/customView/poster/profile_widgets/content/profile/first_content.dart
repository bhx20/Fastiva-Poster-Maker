import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../reusable/reusable.dart';
import '../../../../../../controllers/edit_poster_controller.dart';

class FirstContentView extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FirstContentView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var number = data.value.number;
    var email = data.value.email;
    var address = data.value.address;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                numberView(number),
                emailView(email),
                addressView(address)
              ],
            )));
  }

  Widget numberView(NumberDraft? number) {
    return controller.selectProfile.editObject.value.mobile != null
        ? number!.preview.isTrue
            ? InkWell(
                onTap: () {
                  controller.toolType(ToolRoutes.number);
                },
                child: AppText(
                  " ${controller.selectProfile.editObject.value.mobile ?? emptyString}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontFamily: number.textFont.font.value)
                      .textColor(number.toolColor.color.value
                          .withOpacity(number.toolColor.opacity.value))
                      .size(number.textSize.size.value)
                      .letterSpace(number.textSpace.space.value),
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
                child: AppText(
                  " ${controller.selectProfile.editObject.value.email ?? emptyString}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontFamily: email.textFont.font.value)
                      .textColor(email.toolColor.color.value
                          .withOpacity(email.toolColor.opacity.value))
                      .size(email.textSize.size.value)
                      .letterSpace(email.textSpace.space.value),
                ),
              )
            : const Empty()
        : const Empty();
  }

  Widget addressView(AddressDraft? address) {
    return controller.selectProfile.editObject.value.address != null
        ? address!.preview.isTrue
            ? InkWell(
                onTap: () {
                  controller.toolType(ToolRoutes.address);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: address.textSize.size.value,
                      color: address.toolColor.color.value
                          .withOpacity(address.toolColor.opacity.value),
                    ),
                    AppText(
                      " ${controller.selectProfile.editObject.value.address ?? emptyString}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontFamily: address.textFont.font.value)
                          .textColor(address.toolColor.color.value
                              .withOpacity(address.toolColor.opacity.value))
                          .size(address.textSize.size.value)
                          .letterSpace(address.textSpace.space.value),
                    ),
                  ],
                ),
              )
            : const Empty()
        : const Empty();
  }
}
