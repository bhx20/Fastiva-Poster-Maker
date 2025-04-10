import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/modules/editPoster/views/customView/tools/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../model/local/edit_poster_model.dart';
import '../../../../../reusable/reusable.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/edit_poster_controller.dart';

class ToolHome extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const ToolHome({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: AppText(LocalString.tools,
                    style: poppins.w600.get14
                        .textColor(AppColors.grey.withOpacity(0.3))),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ResetFrame(onPressed: () {
                      controller.resetFrame(controller.currantFrame.value);
                    }),
                    HideFrame(data: data),
                    SelectProfile(onPressed: () {
                      if (controller.selectProfile.myProfiles.length > 1) {
                        Get.toNamed(Routes.SELECT_PROFILE);
                      } else {
                        AppDialogs.showAddProfile(context,
                            content: LocalString.swatchWarning, isEdit: true);
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 16 / 5,
                    crossAxisSpacing: 1.h,
                    mainAxisSpacing: 1.h),
                itemCount: data.value.toolManuList?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller
                          .toolType(data.value.toolManuList?[index].route);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.15))),
                      child: Center(
                        child: AppText(data.value.toolManuList![index].title,
                            style: poppins.w600.get9.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
