import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/core.dart';
import '../../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../../reusable/reusable.dart';
import '../../../../../../controllers/edit_poster_controller.dart';

class FirstLogoView extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FirstLogoView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var logo = data.value.logo;
    return Obx(
      () {
        if (controller.selectProfile.editObject.value.logo != null) {
          if (logo!.preview.isTrue) {
            return Positioned(
              right: logo.hPosition.value,
              bottom: logo.vPosition.value,
              child: GestureDetector(
                onTap: () {
                  controller.toolType(ToolRoutes.logo);
                },
                onPanUpdate: (details) {
                  if (logo.lock.isFalse) {
                    logo.updateLogoPosition(details);
                  }
                },
                child: Opacity(
                  opacity: logo.opacity.value,
                  child: Container(
                    height: logo.scaleSize.value,
                    width: logo.scaleSize.value,
                    decoration: BoxDecoration(
                      border: logo.toolBorder.color.value == AppColors.trans
                          ? null
                          : Border.all(
                              color: logo.toolBorder.color.value
                                  .withOpacity(logo.toolBorder.opacity.value),
                              width: logo.toolBorder.strokeWidth.value,
                              strokeAlign: BorderSide.strokeAlignInside),
                      shape: logo.shapeList.first.isSelected.isTrue
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      borderRadius: logo.shapeList.first.isSelected.isTrue
                          ? null
                          : BorderRadius.only(
                              topLeft: Radius.circular(
                                  logo.toolRadius.topLeft.value),
                              bottomLeft: Radius.circular(
                                  logo.toolRadius.bottomLeft.value),
                              bottomRight: Radius.circular(
                                  logo.toolRadius.bottomRight.value),
                              topRight: Radius.circular(
                                  logo.toolRadius.topRight.value)),
                    ),
                    margin: EdgeInsets.only(
                        right: logo.toolMargin.right.value,
                        bottom: logo.toolMargin.bottom.value,
                        top: logo.toolMargin.top.value,
                        left: logo.toolMargin.left.value),
                    child: logo.shapeList.first.isSelected.isTrue
                        ? ClipOval(
                            child: Image.file(
                              File(
                                controller
                                        .selectProfile.editObject.value.logo ??
                                    emptyString,
                              ),
                              color:
                                  logo.toolColor.color.value == AppColors.trans
                                      ? null
                                      : logo.toolColor.color.value.withOpacity(
                                          logo.toolColor.opacity.value),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    logo.toolRadius.topLeft.value),
                                bottomLeft: Radius.circular(
                                    logo.toolRadius.bottomLeft.value),
                                bottomRight: Radius.circular(
                                    logo.toolRadius.bottomRight.value),
                                topRight: Radius.circular(
                                    logo.toolRadius.topRight.value)),
                            child: Image.file(
                              File(
                                controller
                                        .selectProfile.editObject.value.logo ??
                                    emptyString,
                              ),
                              color:
                                  logo.toolColor.color.value == AppColors.trans
                                      ? null
                                      : logo.toolColor.color.value.withOpacity(
                                          logo.toolColor.opacity.value),
                            ),
                          ),
                  ),
                ),
              ),
            );
          } else {
            return const Empty();
          }
        }
        return const Empty();
      },
    );
  }
}
