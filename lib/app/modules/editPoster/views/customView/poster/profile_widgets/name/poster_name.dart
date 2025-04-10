import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/name/profile/first_name.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/name/profile/second_name.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/name/profile/third_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../frame_list_widgets.dart';

class PosterName extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  final ProfileFrame profileFrame;
  const PosterName({super.key, required this.data, required this.profileFrame});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (profileFrame == ProfileFrame.first) ...[
          FirstNameView(data: data)
        ] else if (profileFrame == ProfileFrame.second) ...[
          SecondNameView(data: data)
        ] else if (profileFrame == ProfileFrame.third) ...[
          ThirdNameView(data: data)
        ]
      ],
    );
  }
}
