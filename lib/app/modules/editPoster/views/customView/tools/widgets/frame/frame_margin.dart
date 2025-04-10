import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class FrameMargin extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FrameMargin({
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
                  title: LocalString.frameMargin,
                  isBack: true,
                  backTap: () {
                    controller.toolType(ToolRoutes.frame);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: _topMargin(frame)),
                            Expanded(flex: 1, child: _bottomMargin(frame)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: _leftMargin(frame)),
                          Expanded(flex: 1, child: _rightMargin(frame)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _topMargin(FrameDraft? frame) {
    return AppSlider(
      value: frame!.tooMargin.top,
      min: frame.tooMargin.min.value,
      max: frame.tooMargin.max.value,
      title: LocalString.topMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.tooMargin.top.value = value;
      },
    );
  }

  Widget _bottomMargin(FrameDraft? frame) {
    return AppSlider(
      value: frame!.tooMargin.bottom,
      min: frame.tooMargin.min.value,
      max: frame.tooMargin.max.value,
      title: LocalString.bottomMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.tooMargin.bottom.value = value;
      },
    );
  }

  Widget _rightMargin(FrameDraft? frame) {
    return AppSlider(
      value: frame!.tooMargin.right,
      min: frame.tooMargin.min.value,
      max: frame.tooMargin.max.value,
      title: LocalString.rightMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.tooMargin.right.value = value;
      },
    );
  }

  Widget _leftMargin(FrameDraft? frame) {
    return AppSlider(
      value: frame!.tooMargin.left,
      min: frame.tooMargin.min.value,
      max: frame.tooMargin.max.value,
      title: LocalString.leftMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.tooMargin.left.value = value;
      },
    );
  }
}
