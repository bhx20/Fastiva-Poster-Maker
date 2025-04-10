import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../common.dart';

class EmailFont extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const EmailFont({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var email = data.value.email;
    return Font(
      title: LocalString.emailFont,
      titleTap: () {
        controller.toolType(ToolRoutes.email);
      },
      selectedIndex: email!.textFont.fontIndex,
      selectedFont: email.textFont.font,
      content: controller.selectProfile.editObject.value.email ?? emptyString,
    );
  }
}
