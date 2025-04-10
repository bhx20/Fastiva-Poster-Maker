import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class NameFont extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const NameFont({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var name = data.value.name;
    return Font(
      title: LocalString.nameFont,
      titleTap: () {
        controller.toolType(ToolRoutes.name);
      },
      selectedIndex: name!.textFont.fontIndex,
      selectedFont: name.textFont.font,
      content: controller.selectProfile.editObject.value.name ?? emptyString,
    );
  }
}
