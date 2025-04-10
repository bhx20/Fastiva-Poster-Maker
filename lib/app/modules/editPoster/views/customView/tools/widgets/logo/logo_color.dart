import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class LogoColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const LogoColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var logo = data.value.logo;
    return SelectColor(
      title: LocalString.logoColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.logo);
      },
      opacity: logo!.toolColor.opacity,
      selectedColor: logo.toolColor.color,
    );
  }
}
