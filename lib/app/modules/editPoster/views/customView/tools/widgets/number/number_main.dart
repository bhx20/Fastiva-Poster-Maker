import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class NumberMain extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const NumberMain({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var number = data.value.number;
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _leadingTool(),
              Align(alignment: Alignment.topRight, child: _viewHandler(number)),
              Row(
                children: [
                  Expanded(flex: 1, child: _numberSizeHandler(number)),
                  Expanded(flex: 1, child: _numberSpacingHandler(number)),
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
                        selectedColor: number!.toolColor.color,
                        onTap: () {
                          controller.toolType(ToolRoutes.numberColor);
                        }),
                    FontIcon(
                      onTap: () {
                        controller.toolType(ToolRoutes.numberFont);
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

  Widget _numberSizeHandler(NumberDraft? number) {
    return AppSlider(
      value: number!.textSize.size,
      min: number.textSize.min.value,
      max: number.textSize.max.value,
      title: LocalString.size,
      onChanged: (value) {
        number.textSize.size.value = value;
      },
    );
  }

  Widget _numberSpacingHandler(NumberDraft? number) {
    return AppSlider(
      value: number!.textSpace.space,
      min: number.textSpace.min.value,
      max: number.textSpace.max.value,
      title: LocalString.latterSpacing,
      onChanged: (value) {
        number.textSpace.space.value = value;
      },
    );
  }

  Widget _leadingTool() {
    return LeadingTool(
      onPressed: () {
        controller.toolType(emptyString);
      },
      title: LocalString.number,
    );
  }

  Widget _viewHandler(NumberDraft? number) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResetLogo(onPressed: () {
          number?.resetNumber();
        }),
        PreviewIcon(
          preview: number!.preview,
        ),
      ],
    );
  }
}

class NumberColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const NumberColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var number = data.value.number;
    return SelectColor(
      title: LocalString.numberColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.number);
      },
      opacity: number!.toolColor.opacity,
      selectedColor: number.toolColor.color,
    );
  }
}
