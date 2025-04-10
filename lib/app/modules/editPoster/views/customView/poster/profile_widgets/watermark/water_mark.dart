import 'package:dotted_border/dotted_border.dart';
import 'package:festiva_poster/app/core/assets.dart';
import 'package:festiva_poster/app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../reusable/reusable.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class WaterMark extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const WaterMark({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        data.value.removeWaterMark(true);
      },
      child: Obx(
        () => controller.capture.hideWaterMarkFrame.isTrue
            ? Container(
                width: 10.w,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.all(5),
                child: const DefaultImage(
                  AppImage.logoTr,
                ),
              )
            : SizedBox(
                width: 16.w,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: SizedBox(
                        width: 13.w,
                        child: DottedBorder(
                            color: controller.capture.hideWaterMarkFrame.isTrue
                                ? AppColors.trans
                                : AppColors.white.withOpacity(0.5),
                            dashPattern: const [3, 3],
                            strokeWidth: 1,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.5.h, vertical: 0.8.h),
                            child: Container(
                              width: 19.w,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const DefaultImage(
                                AppImage.logoTr,
                              ),
                            )),
                      ),
                    ),
                    if (controller.capture.hideWaterMarkFrame.isFalse)
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.appColor,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(0.5.w),
                            child: Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 1.2.h,
                            )),
                      )
                  ],
                ),
              ),
      ),
    );
  }
}
