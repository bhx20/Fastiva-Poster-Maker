import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class LogoMargin extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const LogoMargin({
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
                  title: LocalString.logoMargin,
                  isBack: true,
                  backTap: () {
                    controller.toolType(ToolRoutes.logo);
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
                            Expanded(flex: 1, child: _topMargin(logo)),
                            Expanded(flex: 1, child: _bottomMargin(logo)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: _leftMargin(logo)),
                          Expanded(flex: 1, child: _rightMargin(logo)),
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

  Widget _topMargin(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolMargin.top,
      min: logo.toolMargin.min.value,
      max: logo.toolMargin.max.value,
      title: LocalString.topMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        logo.toolMargin.top.value = value;
      },
    );
  }

  Widget _bottomMargin(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolMargin.bottom,
      min: logo.toolMargin.min.value,
      max: logo.toolMargin.max.value,
      title: LocalString.bottomMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        logo!.toolMargin.bottom.value = value;
      },
    );
  }

  Widget _rightMargin(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolMargin.right,
      min: logo.toolMargin.min.value,
      max: logo.toolMargin.max.value,
      title: LocalString.rightMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        logo!.toolMargin.right.value = value;
      },
    );
  }

  Widget _leftMargin(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolMargin.left,
      min: logo.toolMargin.min.value,
      max: logo.toolMargin.max.value,
      title: LocalString.leftMargin,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        logo.toolMargin.left.value = value;
      },
    );
  }
}
