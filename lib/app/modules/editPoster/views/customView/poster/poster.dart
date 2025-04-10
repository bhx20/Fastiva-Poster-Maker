import 'package:festiva_poster/app/core/constant.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/poster/profile_widgets/frame_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/colors.dart';
import '../../../../../model/local/edit_poster_model.dart';
import '../../../../../reusable/reusable.dart';
import '../../../controllers/edit_poster_controller.dart';

class CustomPoster extends GetView<EditPosterController> {
  final String? poster;
  final Rx<FrameSettings> data;
  const CustomPoster({
    this.poster,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var border = data.value.border;
    return Expanded(
      flex: 7,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: RepaintBoundary(
                key: controller.capture.globalKey,
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: Stack(fit: StackFit.expand, children: [
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          border: border!.frameBorder.color.value ==
                                  AppColors.trans
                              ? null
                              : Border.all(
                                  color: border.frameBorder.color.value
                                      .withOpacity(
                                          border.frameBorder.opacity.value),
                                  width: border.frameBorder.strokeWidth.value,
                                  strokeAlign: BorderSide.strokeAlignInside),
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.toolType(emptyString);
                          },
                          child: NetWorkImage(
                            poster ?? emptyString,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    PageView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      onPageChanged: (index) {
                        controller.currantFrame.value = index;
                      },
                      children: [
                        FirstProfileFrame(data: data),
                        SecondProfileFrame(data: data),
                        ThirdProfileFrame(data: data)
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  if (controller.currantFrame.value > 0) {
                    return forwardButton(Icons.arrow_back_ios_new, onTap: () {
                      controller.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  } else {
                    return const Empty();
                  }
                }),
                Obx(() {
                  if (controller.currantFrame.value <
                      controller.frameSettings.length - 1) {
                    return forwardButton(Icons.arrow_forward_ios, onTap: () {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  } else {
                    return const Empty();
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget forwardButton(
    IconData icon, {
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.trans,
      highlightColor: AppColors.trans,
      child: Container(
          height: 12.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.grey.withOpacity(0.3),
              )),
          padding: EdgeInsets.all(0.1.h),
          margin: EdgeInsets.only(
            left: 2.5.w,
            right: 2.5.w,
          ),
          child: Icon(
            icon,
            size: 5.w,
          )),
    );
  }
}
