import 'package:festiva_poster/app/modules/editPoster/controllers/edit_poster_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/frame/poster_frame.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/logo/poster_logo.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/name/poster_name.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/watermark/water_mark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../reusable/globle_widget.dart';

enum ProfileFrame { first, second, third }


//==============================================================================
// **  First Profile Frame  **
//==============================================================================


class FirstProfileFrame extends GetView<EditPosterController> {
  const FirstProfileFrame({
    super.key,
    required this.data,
  });
  final Rx<FrameSettings> data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Obx(() {
          if (data.value.removeWaterMark.isFalse) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                WaterMark(data: data),
              ],
            );
          } else {
            return const Empty();
          }
        }),
        PosterFrame(
          data: data,
          profileFrame: ProfileFrame.first,
        ),
        PosterLogo(
          data: data,
          profileFrame: ProfileFrame.first,
        ),
        PosterName(
          data: data,
          profileFrame: ProfileFrame.first,
        )
      ],
    );
  }
}

//==============================================================================
// **  Second Profile Frame **
//==============================================================================

class SecondProfileFrame extends GetView<EditPosterController> {
  const SecondProfileFrame({
    super.key,
    required this.data,
  });
  final Rx<FrameSettings> data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Obx(() {
          if (data.value.removeWaterMark.isFalse) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WaterMark(data: data),
              ],
            );
          } else {
            return const Empty();
          }
        }),
        PosterFrame(
          data: data,
          profileFrame: ProfileFrame.second,
        ),
        PosterLogo(
          data: data,
          profileFrame: ProfileFrame.second,
        ),
        PosterName(
          data: data,
          profileFrame: ProfileFrame.second,
        )
      ],
    );
  }
}

//==============================================================================
// **  Third Profile Frame **
//==============================================================================

class ThirdProfileFrame extends GetView<EditPosterController> {
  const ThirdProfileFrame({
    super.key,
    required this.data,
  });
  final Rx<FrameSettings> data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Obx(() {
          if (data.value.removeWaterMark.isFalse) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                WaterMark(data: data),
              ],
            );
          } else {
            return const Empty();
          }
        }),
        PosterFrame(
          data: data,
          profileFrame: ProfileFrame.third,
        ),
        PosterLogo(
          data: data,
          profileFrame: ProfileFrame.third,
        ),

      ],
    );
  }
}
