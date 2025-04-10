import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:festiva_poster/app/reusable/app_widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class LogoMain extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const LogoMain({
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
            LeadingTool(
              onPressed: () {
                controller.toolType(emptyString);
              },
              title: LocalString.logo,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: _viewHandler(logo)),
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: _opacityHandler(logo)),
                        Expanded(flex: 1, child: _scaleHandler(logo))
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 0.5.h, right: 5.w, left: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ColorPicker(
                                  onTap: () {
                                    controller.toolType(ToolRoutes.logoColor);
                                  },
                                  selectedColor: logo!.toolColor.color),
                              ShapeIcon(onTap: () {
                                controller.toolType(ToolRoutes.logoRadius);
                              }),
                              MarginIcon(
                                  onTap: () {
                                    controller.toolType(ToolRoutes.logoMargin);
                                  },
                                  title: LocalString.margin),
                              BorderIcon(onTap: () {
                                controller.toolType(ToolRoutes.logoBorder);
                              }),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewHandler(LogoDraft? logo) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResetLogo(
          onPressed: () {
            logo?.resetLogo();
          },
        ),
        PreviewIcon(
          preview: logo!.preview,
        ),
        LockIcon(
          lock: logo.lock,
        ),
      ],
    );
  }

  Widget _opacityHandler(LogoDraft? logo) {
    return AppSlider(
      value: logo!.opacity,
      min: logo.minOpacity.value,
      max: logo.maxOpacity.value,
      title: LocalString.opacity,
      onChanged: (value) {
        logo.opacity.value = value;
      },
    );
  }

  Widget _scaleHandler(LogoDraft? logo) {
    return AppSlider(
      value: logo!.scaleSize,
      min: logo.minScale.value,
      max: logo.maxScale.value,
      title: LocalString.scale,
      onChanged: (value) {
        logo.scaleSize.value = value;
      },
    );
  }
}
