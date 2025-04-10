import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/core.dart';
import '../../../reusable/reusable.dart';
import '../controllers/preview_download_controller.dart';

class PreviewDownloadView extends StatelessWidget {
  const PreviewDownloadView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PreviewDownloadController(),
        builder: (controller) {
          return appScaffold(
            backgroundColor: AppColors.white,
            appBar: myAppBar(
              titleText: LocalString.preview,
              isBack: true,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Image.memory(
                      controller.downloadArgument.byte!.buffer.asUint8List(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                controller.previewList.length,
                                (index) => InkWell(
                                      onTap: () {
                                        if (index == 0) {
                                          controller.shareTap();
                                        } else if (index == 1) {
                                          controller.homeTap();
                                        } else {
                                          controller.downloadImage();
                                        }
                                      },
                                      splashColor: AppColors.trans,
                                      highlightColor: AppColors.trans,
                                      child: Container(
                                          height: 5.5.h,
                                          width: 5.5.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: AppColors.grey
                                                      .withOpacity(0.3))),
                                          padding: EdgeInsets.all(1.3.h),
                                          margin: EdgeInsets.only(right: 2.w),
                                          child: DefaultImage(
                                            controller.previewList[index].icon,
                                          )),
                                    )),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
