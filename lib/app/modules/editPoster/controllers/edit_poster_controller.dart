import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/address_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/border_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/email_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/frame_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/logo_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/name_controller.dart';
import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/number_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../model/local/edit_poster_model.dart';
import 'frame/frame_list_controller.dart';
import 'poster_controller/capture_controller.dart';
import 'poster_controller/profile_controller.dart';

class EditPosterController extends GetxController {
//==============================================================================
// ** Properties **
//==============================================================================
  var toolType = emptyString.obs;
  RxList<Rx<FrameSettings>> frameSettings = <Rx<FrameSettings>>[].obs;
  CaptureController capture = CaptureController.instance;
  SelectProfileController selectProfile = SelectProfileController.instance;
  PageController pageController = PageController();
  RxInt currantFrame = 0.obs;

//==============================================================================
// ** Life Cycle **
//==============================================================================
  @override
  void onInit() {
    super.onInit();
    setVisibleWaterMark();
    setProfileFrameData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

//==============================================================================
// **  Functions **
//==============================================================================

  setVisibleWaterMark() {
    for (int i = 0; i < frameSettings.length; i++) {
      if (frameSettings[i].value.removeWaterMark.isTrue) {
        frameSettings[i].value.removeWaterMark(false);
      }
    }
  }

  setProfileFrameData() {
    selectProfile.getProfileList();
    selectProfile.setInitProfile();
    frameSettings.value = [
      FirstProfileController.instance.object,
      SecondProfileController.instance.object,
      ThirdProfileController.instance.object,
    ];
  }

  void resetFrame(int currentFrame) {
    switch (currentFrame) {
      case 0:
        FirstAddressController.instance.resetAddress();
        FirstBorderController.instance.resetBorder();
        FirstEmailController.instance.resetEmail();
        FirstFrameController.instance.resetFrame();
        FirstLogoController.instance.resetLogo();
        FirstNameController.instance.resetName();
        FirstNumberController.instance.resetNumber();
        break;
      case 1:
        SecondAddressController.instance.resetAddress();
        SecondBorderController.instance.resetBorder();
        SecondEmailController.instance.resetEmail();
        SecondFrameController.instance.resetFrame();
        SecondLogoController.instance.resetLogo();
        SecondNameController.instance.resetName();
        SecondNumberController.instance.resetNumber();
        break;
      case 2:
        ThirdAddressController.instance.resetAddress();
        ThirdBorderController.instance.resetBorder();
        ThirdEmailController.instance.resetEmail();
        ThirdFrameController.instance.resetFrame();
        ThirdLogoController.instance.resetLogo();
        ThirdNameController.instance.resetName();
        ThirdNumberController.instance.resetNumber();
        break;
    }
  }
}
