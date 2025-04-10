import 'package:festiva_poster/app/model/response/home_poster_data.dart';
import 'package:festiva_poster/app/reusable/animations/delay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/core.dart';
import '../../../reusable/reusable.dart';
import '../../../routes/app_pages.dart';
import '../controllers/picture_controller.dart';

class PictureView extends StatefulWidget {
  const PictureView({super.key});

  @override
  State<PictureView> createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  @override
  void initState() {
    Get.put(PictureController(), permanent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PictureController>(
        builder: (controller) => CheckConnection(
              title: LocalString.picture,
              child: appScaffold(
                  appBar: myAppBar(
                      titleText: LocalString.picture,
                      isManu: true,
                      leadingTap: () {
                        Scaffold.of(context).openDrawer();
                      }),
                  body: Obx(() {
                    if (controller.isPosterData.isFalse) {
                      return _screenLoader();
                    } else {
                      if (controller.posterDataList.value.result != null) {
                        var catagoryList = controller.picturePaginatedList;
                        catagoryList.sort(
                            (a, b) => b.sortOrder!.compareTo(a.sortOrder!));
                        return SingleChildScrollView(
                          controller: controller.scrollController,
                          child: Column(
                            children: [
                              DelayedWidget(
                                from: DelayFrom.bottom,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 2.w,
                                      right: 2.w,
                                      bottom: 1.h,
                                      top: 1.h),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate: grid(),
                                    itemCount: catagoryList.length,
                                    itemBuilder: (context, index) {
                                      return _pictureDataItem(
                                          catagoryList, index);
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
                        return NoData(
                          title: LocalString.empty,
                          subTitle: LocalString.emptyImages,
                        );
                      }
                    }
                  })),
            ));
  }

//==============================================================================
  Widget _pictureDataItem(List<CategoryList>? data, int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CATEGORY_DETAILS,
            arguments: data?[index].catId ?? "1");
      },
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: NetWorkImage(
                    data?[index].posterList?.first.imgUrl ?? emptyString,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.trans,
                        AppColors.black.withOpacity(0.6)
                      ])),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.5.h, bottom: 2.h, left: 1.w, right: 1.w),
              child: AppText(
                data?[index].catName ?? " ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: poppins.white.w600.get9,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _screenLoader() {
    return Padding(
      padding: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.h, top: 1.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
            crossAxisSpacing: 1.h,
            mainAxisSpacing: 1.h),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const SimmerLoader(
            radius: 10,
          );
        },
      ),
    );
  }
}
