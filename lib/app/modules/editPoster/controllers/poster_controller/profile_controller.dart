import 'package:get/get.dart';

import '../../../../model/response/profile_data_model.dart';
import '../../../../uttils/uttils.dart';
import '../../../profile/controllers/profile_controller.dart';

class SelectProfileController {
  static final SelectProfileController instance =
      SelectProfileController._internal();

  factory SelectProfileController() {
    return instance;
  }
  SelectProfileController._internal();

  var isLoaded = false.obs;

  Rx<ProfileData> editObject = ProfileData().obs;
  var selectedIdx = 0.obs;
  RxList<ProfileData> myProfiles = <ProfileData>[].obs;

  /// get profile list
  getProfileList() async {
    isLoaded(false);
    myProfiles.value = Get.put(ProfileController()).myProfiles;
    myProfiles.sort((a, b) {
      DateTime dateA =
          DateTime.parse(a.dbCreatedAt ?? DateTime.now().toString());
      DateTime dateB =
          DateTime.parse(b.dbCreatedAt ?? DateTime.now().toString());
      return dateB.compareTo(dateA);
    });
    isLoaded(true);
  }

  /// set the poster profile
  setInitProfile() async {
    if (myProfiles.isNotEmpty) {
      for (int index = 0; index < myProfiles.length; index++) {
        int selectProfile =
            await PreferenceHelper.instance.getData(Pref.selectProfile);
        if (selectProfile == myProfiles[index].dbId) {
          selectedIdx.value = selectProfile;
          editObject.value = myProfiles[index];
          appPrint(editObject);
        } else {
          if (selectProfile == 0) {
            if (index == 0) {
              await PreferenceHelper.instance
                  .setData(Pref.selectProfile, myProfiles[index].dbId ?? 0);
              selectedIdx.value = myProfiles[index].dbId ?? 0;
              editObject.value = myProfiles[index];
            }
          }
        }
      }
    }
  }

  /// set the poster profile
  setProfile(int index) async {
    if (myProfiles.isNotEmpty) {
      selectedIdx.value = myProfiles[index].dbId ?? 0;
      editObject.value = myProfiles[index];
      await PreferenceHelper.instance
          .setData(Pref.selectProfile, selectedIdx.value);
      Get.back();
      appPrint(editObject);
    }
  }
}
