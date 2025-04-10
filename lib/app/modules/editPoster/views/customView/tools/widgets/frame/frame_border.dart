import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class FrameBorder extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FrameBorder({
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
                  title: LocalString.logoBorder,
                  isBack: true,
                  backTap: () {
                    controller.toolType(ToolRoutes.frame);
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 40.w,
                    child: ColorPicker(
                        title: LocalString.borderColor,
                        onTap: () {
                          controller.toolType(ToolRoutes.frameBorderColor);
                        },
                        selectedColor: frame!.toolBorder!.color),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: _borderStock(frame),
                ),
                _borderOpacity(frame),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _borderStock(FrameDraft frame) {
    return AppSlider(
      value: frame.toolBorder.strokeWidth,
      min: frame.toolBorder.strokeWidthMin.value,
      max: frame.toolBorder.strokeWidthMax.value,
      title: LocalString.strokeWidth,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.toolBorder.strokeWidth.value = value;
      },
    );
  }

  Widget _borderOpacity(FrameDraft frame) {
    return AppSlider(
      value: frame.toolBorder.opacity,
      min: frame.toolBorder.opacityMin.value,
      max: frame.toolBorder.opacityMax.value,
      title: LocalString.borderOpacity,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        frame.toolBorder.opacity.value = value;
      },
    );
  }
}

class FrameBorderColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FrameBorderColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var frame = data.value.frame;
    return SelectColor(
      title: LocalString.borderColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.frameBorder);
      },
      opacity: frame!.toolBorder.opacity,
      selectedColor: frame.toolBorder.color,
    );
  }
}
