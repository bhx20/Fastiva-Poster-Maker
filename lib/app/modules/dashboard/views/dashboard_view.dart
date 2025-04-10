import 'dart:io';

import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../reusable/reusable.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
//==============================================================================
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (Get.find<HomeController>().searchPage.isTrue) {
                Get.find<HomeController>().searchPage(false);
                Get.find<HomeController>().isSearch(false);
              } else {
                AppDialogs.warning(context, content: LocalString.exitWarning,
                    actionTap: () {
                  exit(0);
                });
              }
              return false;
            },
            child: appScaffold(
              //key: drawerKey,
              body: _screenView(controller),
              bottomNavigationBar: _navigationBar(controller),
            ),
          );
        });
  }

//==============================================================================
  Widget _screenView(DashboardController controller) {
    return IndexedStack(
        index: controller.currentIndex.value,
        children: controller.screenWidgets);
  }

//==============================================================================
  Widget _navigationBar(DashboardController controller) {
    return Container(
      height: 7.5.h,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.appColor.withOpacity(0.2)),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.6),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: FittedBox(
        alignment: Alignment.topCenter,
        child: Row(
          children: List.generate(
              controller.iconList.length,
              (index) => InkWell(
                    onTap: () {
                      setState(() {
                        controller.currentIndex.value = index;
                      });
                    },
                    splashColor: AppColors.trans,
                    highlightColor: AppColors.trans,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (index != 2) ...[
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                              bottom: index == controller.currentIndex.value
                                  ? 0
                                  : 3.w,
                              right: 5.w,
                              left: 5.w,
                            ),
                            width: 15.w,
                            height: index == controller.currentIndex.value
                                ? 0.5.h
                                : 0,
                            decoration: const BoxDecoration(
                                color: AppColors.appColor,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(5))),
                          ),
                        ] else ...[
                          Container(
                            margin: EdgeInsets.only(
                              right: 5.w,
                              left: 5.w,
                            ),
                            width: 20.w,
                          )
                        ],
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: DefaultImage(
                            index == controller.currentIndex.value
                                ? controller.iconList[index].selected
                                : controller.iconList[index].unSelected,
                            color: index == controller.currentIndex.value
                                ? AppColors.appColor
                                : AppColors.grey,
                            width: index == 2 ? 11.w : 7.w,
                          ),
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
