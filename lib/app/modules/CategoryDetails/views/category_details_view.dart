import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/model/response/poster_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../reusable/animations/delay_widget.dart';
import '../../../reusable/reusable.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/category_details_controller.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  void initState() {
    super.initState();
    Get.put(CategoryDetailsController()).getData();
  }

  @override
  Widget build(BuildContext context) {
    return CheckConnection(
      title: LocalString.categoryPoster,
      child: GetBuilder<CategoryDetailsController>(
        builder: (controller) {
          return _posterView(controller);
        },
      ),
    );
  }

//==============================================================================
// ** Main Widgets **
//==============================================================================

  Widget _posterView(CategoryDetailsController controller) {
    return appScaffold(
      appBar: myAppBar(
          titleWidget: Obx(() => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: AppText(
                    controller.isPosterDetails.isFalse
                        ? emptyString
                        : controller.posterDetailsList.value.result?.catName ??
                            emptyString,
                    style: poppins.w600.get13.black),
              )),
          isBack: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Get.arguments == "19") ...[
            Obx(() {
              if (controller.isCatagoryData.isFalse) {
                return _catagoryLoader();
              } else {
                return _catagoryWidget(controller);
              }
            }),
          ] else ...[
            const Empty()
          ],
          Expanded(
            child: Obx(() {
              if (controller.isPosterDetails.isFalse) {
                return _screenLoader();
              } else {
                var data = controller.categoryPaginatedList;

                return _categoryDetails(controller, data);
              }
            }),
          )
        ],
      ),
    );
  }

//==============================================================================
// ** Child Widgets **
//==============================================================================

  Widget _catagoryWidget(CategoryDetailsController controller) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: DelayedWidget(
          from: DelayFrom.right,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                controller.catagoryList.value.result?.categoryList?.length ?? 0,
                (index) => Padding(
                      padding:
                          EdgeInsets.only(top: 1.5.h, left: 1.h, right: 1.h),
                      child: InkWell(
                        onTap: () {
                          controller.selectedCatagory(index);
                          controller.getPosterDetailsData(
                              url: controller.catagoryList.value.result
                                      ?.categoryList?[index].catId ??
                                  "19");
                        },
                        splashColor: AppColors.trans,
                        highlightColor: AppColors.trans,
                        child: SizedBox(
                          height: 9.1.h,
                          width: 8.h,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          AppColors.appColor.withOpacity(0.3),
                                    )),
                                child: Container(
                                  height: 5.5.h,
                                  width: 5.5.h,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.selectedCatagory.value ==
                                                  index
                                              ? AppColors.appColor
                                              : AppColors.white,
                                      border: controller
                                                  .selectedCatagory.value ==
                                              index
                                          ? Border.all(
                                              color: AppColors.white, width: 2)
                                          : Border.all(color: AppColors.trans),
                                      shape: BoxShape.circle),
                                  padding: EdgeInsets.all(1.5.h),
                                  child: DefaultImage(
                                    controller.catagoryList.value.result
                                            ?.categoryList?[index].imgUrl ??
                                        emptyString,
                                    color: controller.selectedCatagory.value ==
                                            index
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    controller.catagoryList.value.result
                                            ?.categoryList?[index].catName ??
                                        emptyString,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: poppins.get7.w500.textHeight(0.9),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }

  Widget _categoryDetails(
      CategoryDetailsController controller, RxList<PosterList>? posterData) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          DelayedWidget(
            duration: const Duration(milliseconds: 1000),
            from: DelayFrom.bottom,
            child: Padding(
                padding: EdgeInsets.only(
                    bottom: 1.h, left: 1.h, right: 1.h, top: 1.5.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: grid(),
                  itemCount: posterData!.length,
                  itemBuilder: (context, index) {
                    posterData[index].isLiked?.value = controller.imagesList
                        .any((likesData) =>
                            likesData.images == posterData[index].imgUrl);
                    return _gridItem(
                      controller,
                      posterData,
                      index,
                      context,
                    );
                  },
                )),
          ),
          Obx(() {
            if (controller.paginatedLoader.isTrue) {
              return const PaginatedLoader();
            } else {
              return const Empty();
            }
          })
        ],
      ),
    );
  }

  InkWell _gridItem(
    CategoryDetailsController controller,
    List<PosterList>? data,
    int dynamicIndex,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        Get.put(HomeController()).openPoster(context,
            image: data?[dynamicIndex].imgUrl ?? emptyString,
            pro: data?[dynamicIndex].isPremium ?? 0);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: NetWorkImage(
              data?[dynamicIndex].imgUrl ?? emptyString,
              fit: BoxFit.cover,
            ),
          ),
          _likeButton(
            controller,
            data,
            dynamicIndex,
          )
        ],
      ),
    );
  }

  Align _likeButton(
    CategoryDetailsController controller,
    List<PosterList>? data,
    int childIndex,
  ) {
    var value = data?[childIndex];
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {
          value?.isLiked!.value = !value.isLiked!.value;
          if (value!.isLiked!.value == true) {
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
                value!.isLiked!.value == true
                    ? AppIcon.likesFill
                    : AppIcon.likes,
                height: 2.5.h,
                width: 2.5.h,
                color: value.isLiked!.value == true
                    ? AppColors.red
                    : AppColors.white,
              )),
        ),
      ),
    );
  }

  Widget _screenLoader() {
    return Padding(
      padding: EdgeInsets.only(right: 1.h, left: 1.h, bottom: 1.h, top: 1.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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

  Widget _catagoryLoader() {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              10,
              (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SimmerLoader(
                          height: 5.5.h,
                          width: 5.5.h,
                          radius: 100,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h),
                          child: SimmerLoader(
                            radius: 0,
                            height: 1.h,
                            width: 6.h,
                          ),
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
