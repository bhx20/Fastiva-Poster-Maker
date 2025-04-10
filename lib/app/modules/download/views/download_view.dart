import 'package:festiva_poster/app/core/colors.dart';
import 'package:festiva_poster/app/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/local_string.dart';
import '../../../model/global.dart';
import '../../../reusable/animations/delay_widget.dart';
import '../../../reusable/reusable.dart';
import '../../../routes/app_pages.dart';
import '../controllers/download_controller.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  @override
  void initState() {
    Get.put(DownloadController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadController>(
        builder: (controller) => CheckConnection(
              title: LocalString.download,
              child: appScaffold(
                  appBar: myAppBar(
                      titleText: LocalString.download,
                      isManu: true,
                      leadingTap: () {
                        Scaffold.of(context).openDrawer();
                      }),
                  body: Obx(() {
                    if (controller.paginatedDownloadList.isNotEmpty) {
                      if (controller.downloadLoaded.isTrue) {
                        controller.paginatedDownloadList.sort(
                            (a, b) => b.dbCreatedAt!.compareTo(a.dbCreatedAt!));
                        return SingleChildScrollView(
                          controller: controller.scrollController,
                          child: Column(
                            children: [
                              DelayedWidget(
                                from: DelayFrom.bottom,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 1.h,
                                      left: 1.h,
                                      bottom: 1.h,
                                      top: 1.h),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate: grid(),
                                    itemCount:
                                        controller.paginatedDownloadList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () async {
                                          var byteData = await controller
                                              .loadImageByteData(controller
                                                      .paginatedDownloadList[
                                                          index]
                                                      .images ??
                                                  emptyString);
                                          Get.toNamed(Routes.PREVIEW_DOWNLOAD,
                                              arguments: DownloadArgument(
                                                  imagePath: controller
                                                          .paginatedDownloadList[
                                                              index]
                                                          .images ??
                                                      emptyString,
                                                  isDownload: true,
                                                  byte: byteData));
                                        },
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: DefaultImage(controller
                                                  .paginatedDownloadList[index]
                                                  .images),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: InkWell(
                                                onTap: () {
                                                  AppDialogs.warning(context,
                                                      content: LocalString
                                                          .deleteWarning,
                                                      actionTap: () {
                                                    controller.deleteFile(
                                                        filePath: controller
                                                                .paginatedDownloadList[
                                                                    index]
                                                                .images ??
                                                            emptyString,
                                                        id: controller
                                                                .paginatedDownloadList[
                                                                    index]
                                                                .dbId ??
                                                            0);
                                                  });
                                                },
                                                child: Container(
                                                  height: 5.h,
                                                  width: 5.h,
                                                  decoration: const BoxDecoration(
                                                      color: AppColors.red,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(30),
                                                              topRight: Radius
                                                                  .circular(
                                                                      5))),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 0.8.h,
                                                              horizontal: 1.h),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: AppColors.white,
                                                        size: 2.5.h,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Obx(() {
                                if (controller.loadPaginate.isTrue) {
                                  return const PaginatedLoader();
                                } else {
                                  return const Empty();
                                }
                              })
                            ],
                          ),
                        );
                      } else {
                        return _loader();
                      }
                    } else {
                      return NoData(
                        title: LocalString.empty,
                        subTitle: LocalString.emptyDownLoad,
                      );
                    }
                  })),
            ));
  }

  Widget _loader() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 1.h, left: 1.h, bottom: 1.h, top: 1.h),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: grid(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const SimmerLoader(
              radius: 10,
            );
          },
        ),
      ),
    );
  }
}
