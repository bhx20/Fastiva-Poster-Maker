import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class FrameShape extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FrameShape({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var frame = data.value.frame;
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LeadingTool(
                  onPressed: () {
                    controller.toolType(emptyString);
                  },
                  title: LocalString.frameRadius,
                  isBack: true,
                  backTap: () {
                    controller.toolType(ToolRoutes.frame);
                  },
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: _topLeftRadius(frame)),
                          Expanded(flex: 1, child: _topRightRadius(frame)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: _bottomLeftRadius(frame)),
                        Expanded(flex: 1, child: _bottomRightRadius(frame)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: _nameBoxRadius(frame),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _topLeftRadius(FrameDraft? frame) {
    return AppSlider(
      value: frame!.toolRadius.topLeft,
      min: frame.toolRadius.min.value,
      max: frame.toolRadius.max.value,
      title: LocalString.topLeft,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.toolRadius.topLeft.value = value;
      },
    );
  }

  Widget _topRightRadius(FrameDraft? frame) {
    return AppSlider(
      value: frame!.toolRadius.topRight,
      min: frame.toolRadius.min.value,
      max: frame.toolRadius.max.value,
      title: LocalString.topRight,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.toolRadius.topRight.value = value;
      },
    );
  }

  Widget _bottomLeftRadius(FrameDraft? frame) {
    return AppSlider(
      value: frame!.toolRadius.bottomLeft,
      min: frame.toolRadius.min.value,
      max: frame.toolRadius.max.value,
      title: LocalString.bottomLeft,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.toolRadius.bottomLeft.value = value;
      },
    );
  }

  Widget _bottomRightRadius(FrameDraft? frame) {
    return AppSlider(
      value: frame!.toolRadius.bottomRight,
      min: frame.toolRadius.min.value,
      max: frame.toolRadius.max.value,
      title: LocalString.bottomRight,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.toolRadius.bottomRight.value = value;
      },
    );
  }

  Widget _nameBoxRadius(FrameDraft? frame) {
    return AppSlider(
      value: frame!.nameBoxRadius,
      min: frame.minNameBox.value,
      max: frame.maxNameBox.value,
      title: LocalString.nameBoxRadius,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.nameBoxRadius.value = value;
      },
    );
  }
}
