import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/logo/profile/first_logo.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/logo/profile/second_logo.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/logo/profile/third_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../controllers/edit_poster_controller.dart';
import '../frame_list_widgets.dart';

class PosterLogo extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  final ProfileFrame profileFrame;
  const PosterLogo({super.key, required this.data, required this.profileFrame});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (profileFrame == ProfileFrame.first) ...[
          FirstLogoView(data: data)
        ] else if (profileFrame == ProfileFrame.second) ...[
          SecondLogoView(data: data)
        ]else if (profileFrame == ProfileFrame.third) ...[
          ThirdLogoView(data: data)
        ]
      ],
    );
  }
}
