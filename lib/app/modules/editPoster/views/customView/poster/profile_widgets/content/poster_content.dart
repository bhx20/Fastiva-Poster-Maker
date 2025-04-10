import 'package:festiva_poster/app/model/local/edit_poster_model.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/content/profile/first_content.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/content/profile/second_content.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/content/profile/third_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/edit_poster_controller.dart';
import '../frame_list_widgets.dart';

class PosterContent extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  final ProfileFrame profileFrame;
  const PosterContent({
    super.key,
    required this.data,
    required this.profileFrame,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (profileFrame == ProfileFrame.first) ...[
          FirstContentView(data: data)
        ] else if (profileFrame == ProfileFrame.second) ...[
          SecondContentView(data: data)
        ]else if (profileFrame == ProfileFrame.third) ...[
          ThirdContentView(data: data)
        ]
      ],
    );
  }
}
