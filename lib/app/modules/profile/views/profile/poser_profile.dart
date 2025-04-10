import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/modules/profile/views/profile/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/global.dart';
import '../../../../reusable/reusable.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/profile_controller.dart';

class PosterProfiles extends GetView<ProfileController> {
  const PosterProfiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return appScaffold(
      appBar: myAppBar(
        isBack: true,
        titleText: LocalString.myProfileList,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        onPressed: () {
          Get.toNamed(Routes.ADD_PROFILE,
              arguments: ProfileArgument(
                isOnBoarding: false,
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: DefaultTabController(
        length: 2,
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          surfaceVariant: Colors.transparent,
                        ),
                  ),
                  child: TabBar(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        // Use the default focused overlay color
                        return states.contains(MaterialState.focused)
                            ? null
                            : Colors.transparent;
                      }),
                      unselectedLabelColor: AppColors.grey,
                      unselectedLabelStyle: poppins.get11.w500,
                      labelStyle: poppins.get11.w600,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: AppColors.trans,
                      indicatorPadding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 0.2.h),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.grey.withOpacity(0.2),
                        ),
                      ),
                      onTap: (index) {},
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: AppText(
                              LocalString.personal,
                              style: poppins.get9,
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: AppText(
                              LocalString.business,
                              style: poppins.get9,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [PersonalProfile(), BusinessProfile()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//==============================================================================
// ** Tab Widgets **
//==============================================================================

class PersonalProfile extends GetView<ProfileController> {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.personalProfileList.isNotEmpty
        ? ListView(
            children: [
              ProfileCard(
                isLoaded: controller.profileLoaded,
                profileList: controller.personalProfileList,
                isPersonal: true,
              ),
            ],
          )
        : const NoData());
  }
}

class BusinessProfile extends GetView<ProfileController> {
  const BusinessProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.businessProfileList.isNotEmpty
        ? ListView(
            children: [
              ProfileCard(
                isLoaded: controller.profileLoaded,
                profileList: controller.businessProfileList,
                isPersonal: false,
              ),
            ],
          )
        : const NoData());
  }
}
