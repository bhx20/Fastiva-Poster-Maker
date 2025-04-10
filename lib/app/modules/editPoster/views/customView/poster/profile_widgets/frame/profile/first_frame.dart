import 'package:festiva_poster/app/modules/editPoster/controllers/edit_poster_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/frame_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/core.dart';
import '../../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../../reusable/reusable.dart';
import '../../content/poster_content.dart';

class FirstFrameView extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FirstFrameView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var frame = data.value.frame;
    return Obx(
      () {
        if (frame!.preview.isTrue) {
          return Positioned(
            bottom: frame.fixBottom.value,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                controller.toolType.value = ToolRoutes.frame;
              },
              onPanUpdate: (details) {
                if (frame.lock.isFalse) {
                  frame.updateFramePosition(details);
                }
              },
              child:Container(

                height: frame.height.value,
                width: Get.width,
                decoration: BoxDecoration(
                  color: frame.toolColor.color.value == AppColors.trans
                      ? null
                      : frame.toolColor.color.value
                          .withOpacity(frame.toolColor.opacity.value),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(frame.toolRadius.topLeft.value),
                      bottomLeft:
                          Radius.circular(frame.toolRadius.bottomLeft.value),
                      bottomRight:
                          Radius.circular(frame.toolRadius.bottomRight.value),
                      topRight:
                          Radius.circular(frame.toolRadius.topRight.value)),
                  border: frame.toolBorder.color.value == AppColors.trans
                      ? null
                      : Border.all(
                          color: frame.toolBorder.color.value
                              .withOpacity(frame.toolBorder.opacity.value),
                          width: frame.toolBorder.strokeWidth.value,
                          strokeAlign: BorderSide.strokeAlignInside),
                ),
                margin: EdgeInsets.only(
                  right: frame.tooMargin.right.value,
                  bottom: frame.tooMargin.bottom.value,
                  top: frame.tooMargin.top.value,
                  left: frame.tooMargin.left.value,
                ),
                child:
                    PosterContent(data: data, profileFrame: ProfileFrame.first),
              ),
            ),
          );
        } else {
          return const Empty();
        }
      },
    );
  }
}
