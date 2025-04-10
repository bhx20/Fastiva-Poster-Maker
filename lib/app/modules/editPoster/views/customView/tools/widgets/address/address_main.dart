import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class AddressMain extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const AddressMain({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var address = data.value.address;
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _leadingTool(),
              Align(
                  alignment: Alignment.topRight, child: _viewHandler(address)),
              Row(
                children: [
                  Expanded(flex: 1, child: _addressSizeHandler(address)),
                  Expanded(flex: 1, child: _addressSpacingHandler(address)),
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
                        selectedColor: address!.toolColor.color,
                        onTap: () {
                          controller.toolType(ToolRoutes.addressColor);
                        }),
                    FontIcon(
                      onTap: () {
                        controller.toolType(ToolRoutes.addressFont);
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

  Widget _addressSizeHandler(AddressDraft? address) {
    return AppSlider(
      value: address!.textSize.size,
      min: address.textSize.min.value,
      max: address.textSize.max.value,
      title: LocalString.size,
      onChanged: (value) {
        address.textSize.size.value = value;
      },
    );
  }

  Widget _addressSpacingHandler(AddressDraft? address) {
    return AppSlider(
      value: address!.textSpace.space,
      min: address.textSpace.min.value,
      max: address.textSpace.max.value,
      title: LocalString.latterSpacing,
      onChanged: (value) {
        address.textSpace.space.value = value;
      },
    );
  }

  Widget _leadingTool() {
    return LeadingTool(
      onPressed: () {
        controller.toolType(emptyString);
      },
      title: LocalString.address,
    );
  }

  Widget _viewHandler(AddressDraft? address) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResetLogo(onPressed: () {
          address?.resetAddress();
        }),
        PreviewIcon(
          onPressed: () {
            address.hideAddress();
          },
          preview: address!.preview,
        ),
      ],
    );
  }
}

class AddressColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const AddressColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var address = data.value.address;
    return SelectColor(
      title: LocalString.addressColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.address);
      },
      opacity: address!.toolColor.opacity,
      selectedColor: address.toolColor.color,
    );
  }
}
