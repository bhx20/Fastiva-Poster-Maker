import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class FrameMain extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FrameMain({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var frame = data.value.frame;
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _leadingTool(),
              Align(alignment: Alignment.topRight, child: _viewHandler(frame)),
              Row(
                children: [
                  Expanded(flex: 1, child: _opacityHandler(frame)),
                  Expanded(flex: 1, child: _frameHeightHandler(frame)),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.5.h, right: 5.w, left: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ColorPicker(
                        selectedColor: frame!.toolColor.color,
                        onTap: () {
                          controller.toolType(ToolRoutes.frameColor);
                        }),
                    ShapeIcon(
                        onTap: () {
                          controller.toolType(ToolRoutes.frameShape);
                        },
                        title: LocalString.radius),
                    MarginIcon(
                        onTap: () {
                          controller.toolType(ToolRoutes.frameMargin);
                        },
                        title: LocalString.margin),
                    BorderIcon(onTap: () {
                      controller.toolType(ToolRoutes.frameBorder);
                    }),
                    // ContentAlign(onTap: () {
                    //   controller.toolType(ToolRoutes.contentAlign);
                    // }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _frameHeightHandler(FrameDraft? frame) {
    return AppSlider(
      value: frame!.height,
      min: frame.minHeight.value,
      max: frame.maxHeight.value,
      title: LocalString.height,
      onChanged: (value) {
        frame.height.value = value;
      },
    );
  }

  Widget _opacityHandler(FrameDraft? frame) {
    return AppSlider(
      value: frame!.toolColor.opacity,
      min: frame.minOpacity.value,
      max: frame.maxOpacity.value,
      title: LocalString.opacity,
      onChanged: (value) {
        frame.toolColor.opacity.value = value;
      },
    );
  }

  Widget _leadingTool() {
    return LeadingTool(
      onPressed: () {
        controller.toolType(emptyString);
      },
      title: LocalString.frame,
    );
  }

  Widget _viewHandler(FrameDraft? frame) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResetLogo(onPressed: () {
          frame?.resetFrame();
        }),
        PreviewIcon(
          preview: frame!.preview,
        ),
        LockIcon(
          lock: frame.lock,
        )
      ],
    );
  }
}
