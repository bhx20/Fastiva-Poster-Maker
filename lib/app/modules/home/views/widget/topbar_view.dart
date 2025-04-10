import 'package:festiva_poster/app/modules/home/controllers/home_controller.dart';
import 'package:festiva_poster/app/uttils/globle_uttils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../reusable/reusable.dart';

class TopBar extends GetView<HomeController> {
  const TopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
              bottom: BorderSide(
            color: AppColors.appColor.withOpacity(0.2),
          ))),
      child: Stack(
        fit: StackFit.expand,
        children: [_buildHomeAppBar(context), buildSearchBar()],
      ),
    );
  }

//==============================================================================
// ** Helper Widgets **
//==============================================================================

  Widget _buildHomeAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 56,
          child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_outlined,
                color: AppColors.black,
              )),
        ),
        DefaultImage(
          AppImage.logoHome,
          width: 11.h,
        ),
        IconButton(
            onPressed: () {
              controller.isSearch(true);
              appPrint(controller.isSearch.value);
            },
            icon: Icon(
              Icons.search_sharp,
              size: 3.h,
            ))
      ],
    );
  }

  Widget buildSearchBar() {
    return Obx(() {
      if (controller.isSearch.isTrue) {
        return Center(
          child: TextFormField(
            controller: controller.searchController,
            style: poppins.black.w500.get13,
            autofocus: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: AppColors.appColor,
            onChanged: (value) {
              if (value.length >= 2) {
                if (value.isNotEmpty) {
                  controller.searchPage(true);
                } else {
                  controller.searchPage(false);
                }
                controller.isSearchedData(false);
                controller.searchedList.value = controller
                        .posterDataList.value.result?.categoryList!
                        .where((category) => category.tag!
                            .map((tag) => tag.toLowerCase())
                            .any((tag) => tag.contains(value.toLowerCase())))
                        .toList() ??
                    [];
                controller.isSearchedData(true);
              } else {
                controller.searchedList.clear();
              }
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              fillColor: AppColors.white,
              hintStyle: poppins.get9.grey.w400,
              hintText: LocalString.searchCatagory,
              prefixIcon: IconButton(
                  onPressed: () {
                    controller.searchedList.clear();
                    controller.isSearch(false);
                    controller.searchPage(false);
                    controller.searchController.clear();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.appColor,
                    size: 3.h,
                  )),
              suffixIcon: controller.searchPage.isTrue
                  ? IconButton(
                      onPressed: () {
                        controller.searchedList.clear();
                        controller.isSearch(false);
                        controller.searchPage(false);
                        controller.searchController.clear();
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.black,
                        size: 3.h,
                      ))
                  : const Empty(),
            ),
          ),
        );
      } else {
        return const Empty();
      }
    });
  }
}
