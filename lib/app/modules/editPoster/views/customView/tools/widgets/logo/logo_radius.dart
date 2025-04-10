import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/core.dart';
import '../../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../../../reusable/images/default_image.dart';
import '../../../../../controllers/edit_poster_controller.dart';

class LogoRadius extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const LogoRadius({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var logo = data.value.logo;
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LeadingTool(
                  onPressed: () {
                    controller.toolType(emptyString);
                  },
                  title: LocalString.logoRadius,
                  isBack: true,
                  backTap: () {
                    controller.toolType(ToolRoutes.logo);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: Align(
                      alignment: Alignment.topRight, child: _viewHandler(logo)),
                ),
                Obx(
                  () => Opacity(
                    opacity: logo!.shapeList.last.isSelected.isTrue ? 1.0 : 0.3,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: _topLeftRadius(logo)),
                              Expanded(flex: 1, child: _topRightRadius(logo)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(flex: 1, child: _bottomLeftRadius(logo)),
                            Expanded(flex: 1, child: _bottomRightRadius(logo)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _topLeftRadius(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolRadius.topLeft,
      min: logo.toolRadius.min.value,
      max: logo.toolRadius.max.value,
      title: LocalString.topLeft,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        if (logo.shapeList.last.isSelected.isTrue) {
          logo.toolRadius.topLeft.value = value;
        }
      },
    );
  }

  Widget _topRightRadius(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolRadius.topRight,
      min: logo.toolRadius.min.value,
      max: logo.toolRadius.max.value,
      title: LocalString.topRight,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        if (logo.shapeList.last.isSelected.isTrue) {
          logo.toolRadius.topRight.value = value;
        }
      },
    );
  }

  Widget _bottomLeftRadius(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolRadius.bottomLeft,
      min: logo.toolRadius.min.value,
      max: logo.toolRadius.max.value,
      title: LocalString.bottomLeft,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        if (logo.shapeList.last.isSelected.isTrue) {
          logo.toolRadius.bottomLeft.value = value;
        }
      },
    );
  }

  Widget _bottomRightRadius(LogoDraft? logo) {
    return AppSlider(
      value: logo!.toolRadius.bottomRight,
      min: logo.toolRadius.min.value,
      max: logo.toolRadius.max.value,
      title: LocalString.bottomRight,
      titleStyle: poppins.get9.black.w600,
      onChanged: (value) {
        if (logo.shapeList.last.isSelected.isTrue) {
          logo.toolRadius.bottomRight.value = value;
        }
      },
    );
  }

  Widget _viewHandler(LogoDraft? logo) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          logo!.shapeList.length,
          (index) => InkWell(
              onTap: () {
                for (var data in logo.shapeList) {
                  data.isSelected(false);
                }
                logo.shapeList[index].isSelected(true);
              },
              child: Obx(
                () => Container(
                    height: 3.5.h,
                    width: 3.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: logo.shapeList[index].isSelected.isTrue
                            ? AppColors.appColor
                            : AppColors.appColor.withOpacity(0.5)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    padding: const EdgeInsets.all(5),
                    child: DefaultImage(
                      logo.shapeList[index].icon,
                      color: AppColors.white,
                    )),
              ))),
    );
  }
}
