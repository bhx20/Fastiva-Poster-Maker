import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class PosterBorderTool extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const PosterBorderTool({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var border = data.value.border;
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
                  title: LocalString.posterBorder,
                  isBack: true,
                  backTap: () {
                    controller.toolType(emptyString);
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ResetLogo(onPressed: () {
                        border?.resetBorder();
                      }),
                      SizedBox(
                        width: 40.w,
                        child: ColorPicker(
                            title: LocalString.borderColor,
                            onTap: () {
                              controller.toolType(ToolRoutes.posterBorderColor);
                            },
                            selectedColor: border!.frameBorder.color),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: _borderStockWidth(border),
                ),
                _borderOpacity(border),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _borderStockWidth(FrameBorderDraft border) {
    return AppSlider(
      value: border.frameBorder.strokeWidth,
      min: border.frameBorder.strokeWidthMin.value,
      max: border.frameBorder.strokeWidthMax.value,
      title: LocalString.strokeWidth,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        border.frameBorder.strokeWidth.value = value;
      },
    );
  }

  Widget _borderOpacity(FrameBorderDraft border) {
    return AppSlider(
      value: border.frameBorder.opacity,
      min: border.frameBorder.opacityMin.value,
      max: border.frameBorder.opacityMax.value,
      title: LocalString.borderOpacity,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        border.frameBorder.opacity.value = value;
      },
    );
  }
}

class PosterBorderToolColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const PosterBorderToolColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var border = data.value.border;
    return SelectColor(
      title: LocalString.borderColor,
      leadingTap: () {
        controller.toolType(emptyString);
      },
      opacity: border!.frameBorder.opacity,
      selectedColor: border.frameBorder.color,
    );
  }
}
