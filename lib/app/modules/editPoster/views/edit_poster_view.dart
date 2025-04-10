import 'package:festiva_poster/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../reusable/reusable.dart';
import '../controllers/edit_poster_controller.dart';
import 'customView/poster/poster.dart';
import 'customView/tools/tools.dart';

class EditPosterView extends StatelessWidget {
  final String? poster;
  const EditPosterView({
    Key? key,
    this.poster,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EditPosterController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.toolType.value != emptyString) {
                controller.toolType(emptyString);
                return false;
              } else {
                return true;
              }
            },
            child: appScaffold(
              appBar: myAppBar(
                  titleText: LocalString.editPoster,
                  isBack: true,
                  leadingTap: () {
                    Navigator.pop(context);
                  },
                  actionWidget: _downLoadIcon(controller)),
              body: GetBuilder(
                  init: EditPosterController(),
                  builder: (controller) {
                    controller.setVisibleWaterMark();
                    return Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPoster(
                                poster: poster,
                                data: controller.frameSettings[
                                    controller.currantFrame.value]),
                            Tools(
                                data: controller.frameSettings[
                                    controller.currantFrame.value]),
                          ],
                        ));
                  }),
            ),
          );
        });
  }

  Widget _downLoadIcon(EditPosterController controller) {
    return InkWell(
        onTap: () {
          controller.capture.captureImage();
        },
        splashColor: AppColors.trans,
        highlightColor: AppColors.trans,
        child: Obx(
          () => Container(
              height: 5.h,
              width: 5.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grey.withOpacity(0.3))),
              padding: EdgeInsets.all(1.2.h),
              margin: EdgeInsets.only(right: 2.w),
              child: DefaultImage(
                controller.capture.isCapturing.isTrue
                    ? AppImage.loaderBlack
                    : AppIcon.downloadImage,
              )),
        ));
  }
}
