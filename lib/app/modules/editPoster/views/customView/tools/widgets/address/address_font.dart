import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class AddressFont extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const AddressFont({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var address = data.value.address;
    return Font(
      title: LocalString.addressColor,
      titleTap: () {
        controller.toolType(ToolRoutes.address);
      },
      selectedIndex: address!.textFont.fontIndex,
      selectedFont: address.textFont.font,
      content: controller.selectProfile.editObject.value.address ?? emptyString,
    );
  }
}
