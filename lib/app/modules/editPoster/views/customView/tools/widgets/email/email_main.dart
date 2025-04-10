import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class EmailMain extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const EmailMain({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var email = data.value.email;
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _leadingTool(),
              Align(alignment: Alignment.topRight, child: _viewHandler(email)),
              Row(
                children: [
                  Expanded(flex: 1, child: _emailSizeHandler(email)),
                  Expanded(flex: 1, child: _emailSpacingHandler(email)),
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
                        selectedColor: email!.toolColor.color,
                        onTap: () {
                          controller.toolType(ToolRoutes.emailColor);
                        }),
                    FontIcon(
                      onTap: () {
                        controller.toolType(ToolRoutes.emailFont);
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

  Widget _emailSizeHandler(EmailDraft? email) {
    return AppSlider(
      value: email!.textSize.size,
      min: email.textSize.min.value,
      max: email.textSize.max.value,
      title: LocalString.size,
      onChanged: (value) {
        email.textSize.size.value = value;
      },
    );
  }

  Widget _emailSpacingHandler(EmailDraft? email) {
    return AppSlider(
      value: email!.textSpace.space,
      min: email.textSpace.min.value,
      max: email.textSpace.max.value,
      title: LocalString.latterSpacing,
      onChanged: (value) {
        email.textSpace.space.value = value;
      },
    );
  }

  Widget _leadingTool() {
    return LeadingTool(
      onPressed: () {
        controller.toolType(emptyString);
      },
      title: LocalString.email,
    );
  }

  Widget _viewHandler(EmailDraft? email) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResetLogo(onPressed: () {
          email?.resetEmail();
        }),
        PreviewIcon(
          preview: email!.preview,
        ),
      ],
    );
  }
}

class EmailColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const EmailColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var email = data.value.email;
    return SelectColor(
      title: LocalString.emailColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.email);
      },
      opacity: email!.toolColor.opacity,
      selectedColor: email.toolColor.color,
    );
  }
}
