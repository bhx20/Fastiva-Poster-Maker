import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class FrameColor extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const FrameColor({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var frame = data.value.frame;
    return SelectColor(
      title: LocalString.frameColor,
      leadingTap: () {
        controller.toolType(ToolRoutes.frame);
      },
      opacity: frame!.toolColor.opacity,
      selectedColor: frame.toolColor.color,
    );
  }
}
