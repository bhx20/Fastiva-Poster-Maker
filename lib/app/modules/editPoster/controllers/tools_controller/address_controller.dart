import 'package:festiva_poster/app/modules/editPoster/controllers/tools_controller/logo_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/local/edit_poster_model.dart';
import '../../../../uttils/uttils.dart';
import 'frame_controller.dart';
import 'name_controller.dart';

//==============================================================================
// ** First Address **
//==============================================================================

class FirstAddressController {
  static final FirstAddressController instance =
      FirstAddressController._internal();

  factory FirstAddressController() {
    return instance;
  }
  FirstAddressController._internal() {
    setAddressDraft();
  }

  late AddressDraft addressDraft;

  setAddressDraft() {
    addressDraft = AddressDraft(
        preview: true.obs,
        textSize: TextSize(
          min: 6.5.sp.obs,
          max: 10.sp.obs,
          size: 8.sp.obs,
        ),
        textSpace: TextSpace(
          min: 0.0.sp.obs,
          max: 2.0.sp.obs,
          space: 0.0.sp.obs,
        ),
        toolColor: ToolColor(
          color: AppColors.black.obs,
          opacity: 1.0.obs,
        ),
        textFont: TextFont(
          fontIndex: 0.obs,
          font: "Philosopher-Regular".obs,
        ),
        resetAddress: resetAddress,
        hideAddress: hideAddress);
    appPrint(addressDraft);
  }

  resetAddress() {
    var logo = FirstLogoController.instance.logoDraft;
    var address = addressDraft;
    logo.hPosition(address.preview.isTrue ? 3.5.h : 2.5.h);
    address.toolColor.opacity(1.0);
    address.textSize.size(8.sp);
    address.textSpace.space(0.0.sp);
    address.toolColor.color(AppColors.black);
    address.textFont.fontIndex(0);
    address.textFont.font("Philosopher-Regular");
  }

  hideAddress() {
    var logo = FirstLogoController.instance.logoDraft;
    var frame = FirstFrameController.instance.frameDraft;
    var name = FirstNameController.instance.nameDraft;
    var address = addressDraft;
    if (address.preview.isTrue) {
      address.preview(false);
      name.fixBottom.value = name.fixBottom.value - 2.5.h;
      logo.hPosition.value = logo.hPosition.value - 2.h;
      frame.height.value = frame.height.value - 2.h;
    } else {
      address.preview(true);
      frame.height.value = frame.height.value + 2.h;
      name.fixBottom.value = name.fixBottom.value + 2.5.h;
      logo.hPosition.value = logo.hPosition.value + 2.h;
    }
  }
}

//==============================================================================
// ** Second Address **
//==============================================================================

class SecondAddressController {
  static final SecondAddressController instance =
      SecondAddressController._internal();

  factory SecondAddressController() {
    return instance;
  }
  SecondAddressController._internal() {
    setAddressDraft();
  }

  late AddressDraft addressDraft;

  setAddressDraft() {
    addressDraft = AddressDraft(
        preview: true.obs,
        textSize: TextSize(
          min: 6.5.sp.obs,
          max: 10.sp.obs,
          size: 8.sp.obs,
        ),
        textSpace: TextSpace(
          min: 0.0.sp.obs,
          max: 2.0.sp.obs,
          space: 0.0.sp.obs,
        ),
        toolColor: ToolColor(
          color: AppColors.black.obs,
          opacity: 1.0.obs,
        ),
        textFont: TextFont(
          fontIndex: 0.obs,
          font: "Roboto-Regular".obs,
        ),
        resetAddress: resetAddress,
        hideAddress: hideAddress);
    appPrint(addressDraft);
  }

  resetAddress() {
    var logo = SecondLogoController.instance.logoDraft;
    var address = addressDraft;
    logo.hPosition(address.preview.isTrue ? 3.5.h : 2.5.h);
    address.toolColor.opacity(1.0);
    address.textSize.size(8.sp);
    address.textSpace.space(0.0.sp);
    address.toolColor.color(AppColors.black);
    address.textFont.fontIndex(0);
    address.textFont.font("Roboto-Regular");
  }

  hideAddress() {
    var logo = SecondLogoController.instance.logoDraft;
    var frame = SecondFrameController.instance.frameDraft;
    var name = SecondNameController.instance.nameDraft;
    var address = addressDraft;
    if (address.preview.isTrue) {
      address.preview(false);
      name.fixBottom.value = name.fixBottom.value - 2.5.h;
      logo.hPosition.value = logo.hPosition.value - 2.h;
      frame.height.value = frame.height.value - 2.h;
    } else {
      address.preview(true);
      frame.height.value = frame.height.value + 2.h;
      name.fixBottom.value = name.fixBottom.value + 2.5.h;
      logo.hPosition.value = logo.hPosition.value + 2.h;
    }
  }
}

//==============================================================================
// ** Third Address **
//==============================================================================

class ThirdAddressController {
  static final ThirdAddressController instance =
      ThirdAddressController._internal();

  factory ThirdAddressController() {
    return instance;
  }
  ThirdAddressController._internal() {
    setAddressDraft();
  }

  late AddressDraft addressDraft;

  setAddressDraft() {
    addressDraft = AddressDraft(
        preview: true.obs,
        textSize: TextSize(
          min: 6.5.sp.obs,
          max: 10.sp.obs,
          size: 8.sp.obs,
        ),
        textSpace: TextSpace(
          min: 0.0.sp.obs,
          max: 2.0.sp.obs,
          space: 0.0.sp.obs,
        ),
        toolColor: ToolColor(
          color: AppColors.black.obs,
          opacity: 1.0.obs,
        ),
        textFont: TextFont(
          fontIndex: 0.obs,
          font: "Roboto-Regular".obs,
        ),
        resetAddress: resetAddress,
        hideAddress: hideAddress);
    appPrint(addressDraft);
  }

  resetAddress() {
    var logo = ThirdLogoController.instance.logoDraft;
    var address = addressDraft;
    logo.hPosition(address.preview.isTrue ? 3.5.h : 2.5.h);
    address.toolColor.opacity(1.0);
    address.textSize.size(8.sp);
    address.textSpace.space(0.0.sp);
    address.toolColor.color(AppColors.black);
    address.textFont.fontIndex(0);
    address.textFont.font("Roboto-Regular");
  }

  hideAddress() {
    var logo = ThirdLogoController.instance.logoDraft;
    var frame = ThirdFrameController.instance.frameDraft;
    var name = ThirdNameController.instance.nameDraft;
    var address = addressDraft;
    if (address.preview.isTrue) {
      address.preview(false);
      name.fixBottom.value = name.fixBottom.value - 2.5.h;
      logo.hPosition.value = logo.hPosition.value - 2.h;
      frame.height.value = frame.height.value - 2.h;
    } else {
      address.preview(true);
      frame.height.value = frame.height.value + 2.h;
      name.fixBottom.value = name.fixBottom.value + 2.5.h;
      logo.hPosition.value = logo.hPosition.value + 2.h;
    }
  }
}
