import 'package:festiva_poster/app/modules/home/controllers/home_controller.dart';
import 'package:festiva_poster/app/reusable/animations/delay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/response/home_poster_data.dart';
import '../../../../reusable/animations/fade_widget.dart';
import '../../../../reusable/reusable.dart';

class CategoryView extends GetView<HomeController> {
  final bool isLoading;
  final List<CategoryList>? categoryList;
  final int index;
  const CategoryView({
    super.key,
    this.categoryList,
    this.isLoading = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 1.5.h,
            horizontal: 3.w,
          ),
          child: FadeWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isLoading == true
                    ? SimmerLoader(
                        height: 2.h,
                        width: 35.w,
                        radius: 0,
                      )
                    : AppText(
                        categoryList?[index].catName ?? emptyString,
                        style: poppins.w600.get9,
                      ),
                isLoading == true
                    ? SimmerLoader(
                        height: 4.h,
                        width: 20.w,
                        radius: 5,
                      )
                    : _viewAllButton()
              ],
            ),
          ),
        ),
        Obx(() {
          if (controller.isPosterData.isTrue) {
            return DelayedWidget(
              from: DelayFrom.right,
              child: SizedBox(
                height: 20.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 3.w),
                  itemCount: isLoading == true
                      ? 10
                      : categoryList?[index].posterList?.length ?? 0,
                  itemBuilder: (context, childIndex) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      String imageUrl =
                          categoryList?[index].posterList?[childIndex].imgUrl ??
                              '';
                      categoryList?[index]
                              .posterList![childIndex]
                              .isLiked
                              ?.value =
                          controller.imagesList
                              .any((likesData) => likesData.images == imageUrl);
                    });
                    var length = categoryList?[index].posterList!.length ?? 10;
                    return Row(
                      children: [
                        _buildPosterItem(context, childIndex),
                        if (childIndex == length - 1)
                          _viewAllButton(circular: true)
                      ],
                    );
                  },
                ),
              ),
            );
          } else {
            return const Empty();
          }
        })
      ],
    );
  }

  Widget _buildPosterItem(BuildContext context, int childIndex) {
    return Padding(
      padding: EdgeInsets.only(right: 3.w),
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: isLoading == true
            ? const SimmerLoader(
                radius: 10,
              )
            : Stack(
                children: [
                  InkWell(
                    onTap: () {
                      controller.openPoster(context,
                          image: categoryList?[index]
                                  .posterList?[childIndex]
                                  .imgUrl ??
                              emptyString,
                          pro: categoryList?[index]
                                  .posterList?[childIndex]
                                  .isPremium ??
                              0);
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                            border: Border.all(
                                color: AppColors.grey.withOpacity(0.5)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: NetWorkImage(
                              categoryList?[index]
                                      .posterList?[childIndex]
                                      .imgUrl ??
                                  emptyString,
                              width: 10,
                              height: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _likeButton(childIndex)
                ],
              ),
      ),
    );
  }

  Align _likeButton(int childIndex) {
    var value = categoryList![index].posterList![childIndex];
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {
          value.isLiked!.value = !value.isLiked!.value;
          if (value.isLiked!.value == true) {
            controller.likeController
                .addToLikes(value.imgUrl ?? emptyString, value.isPremium ?? 0);
          } else {
            controller.likeController
                .removeToLikes(value.imgUrl ?? emptyString);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(0.8.h),
          child: Obx(() => DefaultImage(
                value.isLiked!.value == true
                    ? AppIcon.likesFill
                    : AppIcon.likes,
                height: 2.h,
                width: 2.h,
                color: value.isLiked!.value == true
                    ? AppColors.red
                    : AppColors.white,
              )),
        ),
      ),
    );
  }

  Widget _viewAllButton({bool? circular}) {
    return InkWell(
      onTap: () {
        controller.viewAll(categoryList, index);
      },
      child: Container(
        width: circular != null ? 8.w : 25.w,
        padding: EdgeInsets.symmetric(vertical: 0.5.h),
        margin: circular != null
            ? EdgeInsets.only(right: 1.h, bottom: 6.h, top: 6.h)
            : EdgeInsets.zero,
        decoration: circular != null
            ? BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.grey.withOpacity(0.2)))
            : BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.grey.withOpacity(0.2))),
        child: Center(
            child: circular != null
                ? Icon(Icons.arrow_forward_ios, size: 5.w)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        LocalString.viewAll,
                        style: poppins.w500.get8,
                      ),
                      SizedBox(width: 1.w),
                      Icon(Icons.arrow_forward_ios, size: 2.5.w)
                    ],
                  )),
      ),
    );
  }
}
