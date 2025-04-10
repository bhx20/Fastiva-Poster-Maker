import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/address/address_font.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/address/address_main.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/email/email_font.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/frame/frame_border.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/frame/frame_color.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/frame/frame_margin.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/frame/frame_shape.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/logo/logo_border.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/logo/logo_margin.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/name/name_font.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/name/name_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../model/local/edit_poster_model.dart';
import '../../../controllers/edit_poster_controller.dart';
import 'tool_home.dart';
import 'widgets/border/border.dart';
import 'widgets/email/email_main.dart';
import 'widgets/frame/frame_main.dart';
import 'widgets/logo/logo_color.dart';
import 'widgets/logo/logo_main.dart';
import 'widgets/logo/logo_radius.dart';
import 'widgets/number/number_font.dart';
import 'widgets/number/number_main.dart';

class Tools extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const Tools({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.appColor.withOpacity(0.2)),
                ),
                color: AppColors.white),
            child: Obx(() {
              ///Logo Tools view
              if (controller.toolType.value == ToolRoutes.logo) {
                return LogoMain(data: data);
              } else if (controller.toolType.value == ToolRoutes.logoRadius) {
                return LogoRadius(data: data);
              } else if (controller.toolType.value == ToolRoutes.logoColor) {
                return LogoColor(data: data);
              } else if (controller.toolType.value == ToolRoutes.logoBorder) {
                return LogoBorder(data: data);
              } else if (controller.toolType.value ==
                  ToolRoutes.logoBorderColor) {
                return LogoBorderColor(data: data);
              } else if (controller.toolType.value == ToolRoutes.logoMargin) {
                return LogoMargin(data: data);
              }

              ///Frame Tools view
              else if (controller.toolType.value == ToolRoutes.frame) {
                return FrameMain(data: data);
              } else if (controller.toolType.value == ToolRoutes.frameColor) {
                return FrameColor(data: data);
              } else if (controller.toolType.value == ToolRoutes.frameMargin) {
                return FrameMargin(data: data);
              } else if (controller.toolType.value == ToolRoutes.frameBorder) {
                return FrameBorder(data: data);
              } else if (controller.toolType.value == ToolRoutes.frameShape) {
                return FrameShape(data: data);
              } else if (controller.toolType.value ==
                  ToolRoutes.frameBorderColor) {
                return FrameBorderColor(data: data);
              }

              ///Name Tools view
              else if (controller.toolType.value == ToolRoutes.name) {
                return NameMain(data: data);
              } else if (controller.toolType.value == ToolRoutes.nameColor) {
                return NameColor(data: data);
              } else if (controller.toolType.value == ToolRoutes.nameFont) {
                return NameFont(data: data);
              }

              ///Number Tools view
              else if (controller.toolType.value == ToolRoutes.number) {
                return NumberMain(data: data);
              } else if (controller.toolType.value == ToolRoutes.numberColor) {
                return NumberColor(data: data);
              } else if (controller.toolType.value == ToolRoutes.numberFont) {
                return NumberFont(data: data);
              }

              ///Email Tools view
              else if (controller.toolType.value == ToolRoutes.email) {
                return EmailMain(data: data);
              } else if (controller.toolType.value == ToolRoutes.emailColor) {
                return EmailColor(data: data);
              } else if (controller.toolType.value == ToolRoutes.emailFont) {
                return EmailFont(data: data);
              }

              ///Address Tools view
              else if (controller.toolType.value == ToolRoutes.address) {
                return AddressMain(data: data);
              } else if (controller.toolType.value == ToolRoutes.addressColor) {
                return AddressColor(data: data);
              } else if (controller.toolType.value == ToolRoutes.addressFont) {
                return AddressFont(data: data);
              }

              ///Poster Border Tools view
              else if (controller.toolType.value == ToolRoutes.posterBorder) {
                return PosterBorderTool(data: data);
              } else if (controller.toolType.value ==
                  ToolRoutes.posterBorderColor) {
                return PosterBorderToolColor(data: data);
              } else {
                return ToolHome(data: data);
              }
            })));
  }
}
