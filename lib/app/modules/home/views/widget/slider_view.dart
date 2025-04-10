import 'package:festiva_poster/app/core/constant.dart';
import 'package:festiva_poster/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/response/home_poster_data.dart';
import '../../../../reusable/animations/fade_widget.dart';
import '../../../../reusable/reusable.dart';
import '../../../../routes/app_pages.dart';

class SliderView extends GetView<HomeController> {
  final Result? data;
  final bool? isLoading;
  const SliderView({
    super.key,
    this.data,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    data?.bannerList?.sort((a, b) => b.sortOrder!.compareTo(a.sortOrder!));

    return Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: GetBuilder<HomeController>(
            init: Get.put(HomeController()),
            builder: (controller) => Obx(() {
                  return FadeWidget(
                    child: CarouselSliderWidget(
                      itemCount:
                          isLoading == true ? 3 : data?.bannerList?.length ?? 0,
                      itemBuilder: (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: isLoading == true
                              ? const SimmerLoader()
                              : InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.CATEGORY_DETAILS,
                                        arguments:
                                            data?.bannerList?[itemIndex].catId);
                                  },
                                  child: NetWorkImage(
                                    data?.bannerList?[itemIndex].imgUrl ??
                                        emptyString,
                                    width: Get.width,
                                  )),
                        );
                      },
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      },
                      carouselHeight: 20.h,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.85,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      currentIndex: controller.currentIndex.value,
                    ),
                  );
                })));
    ;
  }
}
