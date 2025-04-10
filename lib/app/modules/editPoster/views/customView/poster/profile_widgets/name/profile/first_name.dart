import 'package:festiva_poster/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../../reusable/reusable.dart';
import '../../../../../../controllers/edit_poster_controller.dart';

class FirstNameView extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FirstNameView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var frame = data.value.frame;
    var name = data.value.name;
    return Obx(() {
      if (controller.selectProfile.editObject.value.name != null) {
        if (name!.preview.isTrue) {
          return Positioned(
            bottom: name.fixBottom.value,
            child: GestureDetector(
              onTap: () {
                controller.toolType(ToolRoutes.name);
              },
              onPanUpdate: (details) {
                if (name.lock.isFalse) {
                  name.updateNamePosition(details);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: frame!.toolColor.color.value == AppColors.trans
                      ? null
                      : frame.toolColor.color.value
                          .withOpacity(frame.toolColor.opacity.value),
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(frame.nameBoxRadius.value)),
                  border: frame.toolBorder.color.value == AppColors.trans
                      ? null
                      : Border.all(
                          color: frame.toolBorder.color.value
                              .withOpacity(frame.toolBorder.opacity.value),
                          width: frame.toolBorder.strokeWidth.value,
                          strokeAlign: BorderSide.strokeAlignInside),
                ),
                margin: EdgeInsets.only(
                  bottom: frame.tooMargin.bottom.value,
                  top: frame.tooMargin.top.value,
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 2.w, top: 3, bottom: 3),
                  child: AppText(
                    " ${controller.selectProfile.editObject.value.name ?? emptyString}",
                    style: TextStyle(fontFamily: name.textFont.font.value)
                        .textColor(name.toolColor.color.value
                            .withOpacity(name.toolColor.opacity.value))
                        .size(name.textSize.size.value)
                        .letterSpace(name.textSpace.space.value),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Empty();
        }
      } else {
        return const Empty();
      }
    });
  }
}
