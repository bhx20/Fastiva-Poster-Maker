import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class NameMain extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const NameMain({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var name = data.value.name;
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _leadingTool(),
              Align(alignment: Alignment.topRight, child: _viewHandler(name)),
              Row(
                children: [
                  Expanded(flex: 1, child: _nameSizeHandler(name)),
                  Expanded(flex: 1, child: _nameSpacingHandler(name)),
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
                        selectedColor: name!.toolColor.color,
                        onTap: () {
                          controller.toolType(ToolRoutes.nameColor);
                        }),
                    FontIcon(
                      onTap: () {
                        controller.toolType(ToolRoutes.nameFont);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _nameSizeHandler(NameDraft? name) {
    return AppSlider(
      value: name!.textSize.size,
      min: name.textSize.min.value,
      max: name.textSize.max.value,
      title: LocalString.size,
      onChanged: (value) {
        name.textSize.size.value = value;
      },
    );
  }

  Widget _nameSpacingHandler(NameDraft? name) {
    return AppSlider(
      value: name!.textSpace.space,
      min: name.textSpace.min.value,
      max: name.textSpace.max.value,
      title: LocalString.latterSpacing,
      onChanged: (value) {
        name.textSpace.space.value = value;
      },
    );
  }

  Widget _leadingTool() {
    return LeadingTool(
      onPressed: () {
        controller.toolType(emptyString);
      },
      title: LocalString.name,
    );
  }

  Widget _viewHandler(NameDraft? name) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResetLogo(onPressed: () {
          name?.resetName();
        }),
        PreviewIcon(
          preview: name!.preview,
        ),
        LockIcon(
          lock: name.lock,
        )
      ],
    );
  }
}

class NameColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const NameColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var name = data.value.name;
    return SelectColor(
      title: LocalString.nameColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.name);
      },
      opacity: name!.toolColor.opacity,
      selectedColor: name.toolColor.color,
    );
  }
}
