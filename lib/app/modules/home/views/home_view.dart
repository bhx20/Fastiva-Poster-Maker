import 'package:festiva_poster/app/modules/home/views/widget/category_view.dart';
import 'package:festiva_poster/app/modules/home/views/widget/home_loader.dart';
import 'package:festiva_poster/app/modules/home/views/widget/slider_view.dart';
import 'package:festiva_poster/app/modules/home/views/widget/topbar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/core.dart';
import '../../../reusable/reusable.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => CheckConnection(
              title: LocalString.home,
              child: appScaffold(
                  body: Column(
                children: [
                  const TopBar(),
                  Expanded(
                    child: Obx(() {
                      return Stack(
                        children: [
                          homeContent(controller),
                          if (controller.searchPage.isTrue)
                            searchContent(controller)
                        ],
                      );
                    }),
                  ),
                ],
              )),
            ));
  }

  Widget homeContent(HomeController controller) {
    if (controller.isCatagoryData.isFalse) {
      return const HomeLoader();
    } else {
      if (controller.homePaginatedList.isNotEmpty) {
        return SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              SliderView(data: controller.posterDataList.value.result),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.homePaginatedList.length +
                    (controller.loadPaginate.isTrue ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < controller.homePaginatedList.length) {
                    return CategoryView(
                      categoryList: controller.homePaginatedList,
                      index: index,
                    );
                  } else {
                    if (controller.loadPaginate.isTrue) {
                      return const PaginatedLoader();
                    } else {
                      return Container();
                    }
                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1.5.h,
                  );
                },
              )
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
  }

  Widget searchContent(HomeController controller) {
    if (controller.isSearchedData.isFalse) {
      return _buildSearchLoader();
    } else {
      var data = controller.searchedList;
      if (controller.searchedList.isNotEmpty) {
        return Container(
          height: Get.height,
          color: AppColors.appBG,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CategoryView(
                    categoryList: data,
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1.5.h,
                  ); // Return an empty widget as separator
                },
              ),
            ),
          ),
        );
      } else {
        return NoData(
          title: LocalString.empty,
          subTitle: LocalString.emptySearch,
        );
      }
    }
  }

  Widget _buildSearchLoader() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.appBG,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CategoryView(
                index: index,
                isLoading: true,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 1.5.h,
              );
            },
          ),
        ),
      ),
    );
  }
}
