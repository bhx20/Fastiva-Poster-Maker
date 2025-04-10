import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class LogoBorder extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const LogoBorder({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var logo = data.value.logo;
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
                    controller.toolType(ToolRoutes.logo);
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 40.w,
                    child: ColorPicker(
                        title: LocalString.borderColor,
                        onTap: () {
                          controller.toolType(ToolRoutes.logoBorderColor);
                        },
                        selectedColor: logo!.toolColor.color),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: _borderStock(logo),
                ),
                _borderOpacity(logo),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _borderStock(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolBorder.strokeWidth,
      min: logo.toolBorder.strokeWidthMin.value,
      max: logo.toolBorder.strokeWidthMax.value,
      title: LocalString.strokeWidth,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        logo.toolBorder.strokeWidth.value = value;
      },
    );
  }

  Widget _borderOpacity(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolBorder.opacity,
      min: logo.toolBorder.opacityMin.value,
      max: logo.toolBorder.opacityMax.value,
      title: LocalString.borderOpacity,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        logo.toolBorder.opacity.value = value;
      },
    );
  }
}

class LogoBorderColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const LogoBorderColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var logo = data.value.logo;
    return SelectColor(
      title: LocalString.borderColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.logoBorder);
      },
      opacity: logo!.toolBorder.opacity,
      selectedColor: logo.toolBorder.color,
    );
  }
}
