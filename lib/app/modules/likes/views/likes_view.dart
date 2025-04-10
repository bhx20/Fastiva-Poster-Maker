import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/core.dart';
import '../../../reusable/animations/delay_widget.dart';
import '../../../reusable/reusable.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/likes_controller.dart';

class LikesView extends StatelessWidget {
  const LikesView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LikesController(),
        builder: (controller) => CheckConnection(
              title: LocalString.likes,
              child: appScaffold(
                appBar: myAppBar(
                    titleText: LocalString.likes,
                    isManu: true,
                    leadingTap: () {
                      Scaffold.of(context).openDrawer();
                    }),
                body: Obx(() {
                  if (controller.likedImages.isNotEmpty) {
                    if (controller.likesLoaded.isTrue) {
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: grid(),
                                  itemCount:
                                      controller.paginatedLikedImages.length,
                                  itemBuilder: (context, index) {
                                    bool isPremium = controller
                                            .paginatedLikedImages[index]
                                            .isPremium ==
                                        "1";
                                    return _likedPosterView(
                                        controller, context, index, isPremium);
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
                      subTitle: LocalString.emptyLikes,
                    );
                  }
                }),
              ),
            ));
  }

  Widget _likedPosterView(
    LikesController controller,
    BuildContext context,
    int index,
    bool isPremium,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        InkWell(
          onTap: () async {
            Get.put(HomeController()).openPoster(context,
                image: controller.paginatedLikedImages[index].images ??
                    emptyString,
                pro: int.parse(
                    controller.paginatedLikedImages[index].isPremium ?? "0"));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: NetWorkImage(
              controller.paginatedLikedImages[index].images ?? emptyString,
              fit: BoxFit.cover,
            ),
          ),
        ),
        _likeButton(controller, context, index)
      ],
    );
  }

  Align _likeButton(
      LikesController controller, BuildContext context, int index) {
    var homeController = Get.put(HomeController());
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {
          AppDialogs.warning(context, content: LocalString.removeFromList,
              actionTap: () async {
            homeController.isPosterData(false);
            controller.removeToLikes(
              controller.likedImages[index].images ?? emptyString,
            );

            homeController.imagesList = await controller.getLikedImagesList();
            homeController.isPosterData(true);
            Get.back();
          });
        },
        child: Padding(
          padding: EdgeInsets.all(0.8.h),
          child: DefaultImage(
            AppIcon.likesFill,
            height: 2.5.h,
            width: 2.5.h,
            color: AppColors.red,
          ),
        ),
      ),
    );
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
