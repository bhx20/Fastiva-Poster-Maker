import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class NumberFont extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const NumberFont({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var number = data.value.number;
    return Font(
      title: LocalString.numberFont,
      titleTap: () {
        controller.toolType(ToolRoutes.number);
      },
      selectedIndex: number!.textFont.fontIndex,
      selectedFont: number.textFont.font,
      content: controller.selectProfile.editObject.value.mobile ?? emptyString,
    );
  }
}
