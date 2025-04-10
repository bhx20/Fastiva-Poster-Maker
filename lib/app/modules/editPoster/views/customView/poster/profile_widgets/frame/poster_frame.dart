import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/frame/profile/first_frame.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/frame/profile/second_frame.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/frame/profile/third_frame.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/frame_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class PosterFrame extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  final ProfileFrame profileFrame;
  const PosterFrame(
      {super.key, required this.data, required this.profileFrame});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (profileFrame == ProfileFrame.first) ...[
          FirstFrameView(data: data)
        ] else if (profileFrame == ProfileFrame.second) ...[
          SecondFrameView(data: data)
        ] else if (profileFrame == ProfileFrame.third) ...[
          ThirdFrameView(data: data)
        ]
      ],
    );
  }
}
