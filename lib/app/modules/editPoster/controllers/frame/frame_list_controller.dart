import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../core/constant.dart';
import '../../../../core/local_string.dart';
import '../../../../model/local/edit_poster_model.dart';
import '../tools_controller/address_controller.dart';
import '../tools_controller/border_controller.dart';
import '../tools_controller/email_controller.dart';
import '../tools_controller/frame_controller.dart';
import '../tools_controller/logo_controller.dart';
import '../tools_controller/name_controller.dart';
import '../tools_controller/number_controller.dart';

///=============================================================================
/// ** First Profile **
///=============================================================================

class FirstProfileController {
  static final FirstProfileController instance =
      FirstProfileController._internal();

  factory FirstProfileController() {
    return instance;
  }

  FirstProfileController._internal() {
    seeProfileFrame();
  }

// ***** Properties ***** //
  late Rx<FrameSettings> object;
  List<ToolManu>? toolManuList = [
    ToolManu(title: LocalString.logo, route: ToolRoutes.logo),
    ToolManu(title: LocalString.frame, route: ToolRoutes.frame),
    ToolManu(title: LocalString.name, route: ToolRoutes.name),
    ToolManu(title: LocalString.number, route: ToolRoutes.number),
    ToolManu(title: LocalString.email, route: ToolRoutes.email),
    ToolManu(title: LocalString.address, route: ToolRoutes.address),
    ToolManu(title: LocalString.border, route: ToolRoutes.posterBorder),
  ];

// ***** Functions ***** //
  seeProfileFrame() {
    object = FrameSettings(
            toolManuList: toolManuList,
            logo: FirstLogoController.instance.logoDraft,
            frame: FirstFrameController.instance.frameDraft,
            name: FirstNameController.instance.nameDraft,
            number: FirstNumberController.instance.numberDraft,
            email: FirstEmailController.instance.emailDraft,
            address: FirstAddressController.instance.addressDraft,
            border: FirstBorderController.instance.borderDraft,
            resetFrame: resetFrameData,
            hideFrame: hideFrameData)
        .obs;
  }

  hideFrameData() {
    FirstFrameController.instance.frameDraft.hideFrame();
    FirstLogoController.instance.logoDraft.hideLogo();
    FirstNameController.instance.nameDraft.hideName();
    FirstNumberController.instance.numberDraft.hideNumber();
    FirstEmailController.instance.emailDraft.hideEmail();
    FirstAddressController.instance.addressDraft.hideAddress();
  }

  resetFrameData() {
    FirstLogoController.instance.logoDraft.resetLogo();
    FirstFrameController.instance.frameDraft.resetFrame();
    FirstNameController.instance.nameDraft.resetName();
    FirstNumberController.instance.numberDraft.resetNumber();
    FirstEmailController.instance.emailDraft.resetEmail();
    FirstAddressController.instance.addressDraft.resetAddress();
    FirstBorderController.instance.borderDraft.resetBorder();
  }
}

///=============================================================================
/// ** Second Profile **
///=============================================================================

class SecondProfileController {
  static final SecondProfileController instance =
      SecondProfileController._internal();

  factory SecondProfileController() {
    return instance;
  }

  SecondProfileController._internal() {
    seeProfileFrame();
  }

// ***** Properties ***** //
  late Rx<FrameSettings> object;
  List<ToolManu>? toolManuList = [
    ToolManu(title: LocalString.logo, route: ToolRoutes.logo),
    ToolManu(title: LocalString.frame, route: ToolRoutes.frame),
    ToolManu(title: LocalString.name, route: ToolRoutes.name),
    ToolManu(title: LocalString.number, route: ToolRoutes.number),
    ToolManu(title: LocalString.email, route: ToolRoutes.email),
    ToolManu(title: LocalString.border, route: ToolRoutes.posterBorder),
  ];

// ***** Functions ***** //
  seeProfileFrame() {
    object = FrameSettings(
            toolManuList: toolManuList,
            logo: SecondLogoController.instance.logoDraft,
            frame: SecondFrameController.instance.frameDraft,
            name: SecondNameController.instance.nameDraft,
            number: SecondNumberController.instance.numberDraft,
            email: SecondEmailController.instance.emailDraft,
            address: SecondAddressController.instance.addressDraft,
            border: SecondBorderController.instance.borderDraft,
            hideFrame: hideFrameData,
            resetFrame: resetFrameData)
        .obs;
  }

  hideFrameData() {
    SecondFrameController.instance.frameDraft.hideFrame();
    SecondLogoController.instance.logoDraft.hideLogo();
    SecondNameController.instance.nameDraft.hideName();
    SecondNumberController.instance.numberDraft.hideNumber();
    SecondEmailController.instance.emailDraft.hideEmail();
    SecondAddressController.instance.addressDraft.hideAddress();
  }

  resetFrameData() {
    SecondLogoController.instance.logoDraft.resetLogo();
    SecondFrameController.instance.frameDraft.resetFrame();
    SecondNameController.instance.nameDraft.resetName();
    SecondNumberController.instance.numberDraft.resetNumber();
    SecondEmailController.instance.emailDraft.resetEmail();
    SecondAddressController.instance.addressDraft.resetAddress();
    SecondBorderController.instance.borderDraft.resetBorder();
  }
}



///=============================================================================
/// ** Tired Profile **
///=============================================================================

class ThirdProfileController {
  static final ThirdProfileController instance =
  ThirdProfileController._internal();

  factory ThirdProfileController() {
    return instance;
  }

  ThirdProfileController._internal() {
    seeProfileFrame();
  }

// ***** Properties ***** //
  late Rx<FrameSettings> object;
  List<ToolManu>? toolManuList = [
    ToolManu(title: LocalString.logo, route: ToolRoutes.logo),
    ToolManu(title: LocalString.frame, route: ToolRoutes.frame),
    ToolManu(title: LocalString.name, route: ToolRoutes.name),
    ToolManu(title: LocalString.number, route: ToolRoutes.number),
    ToolManu(title: LocalString.email, route: ToolRoutes.email),
    ToolManu(title: LocalString.border, route: ToolRoutes.posterBorder),
  ];

// ***** Functions ***** //
  seeProfileFrame() {
    object = FrameSettings(
        toolManuList: toolManuList,
        logo: ThirdLogoController.instance.logoDraft,
        frame: ThirdFrameController.instance.frameDraft,
        name: ThirdNameController.instance.nameDraft,
        number: ThirdNumberController.instance.numberDraft,
        email: ThirdEmailController.instance.emailDraft,
        address: ThirdAddressController.instance.addressDraft,
        border: ThirdBorderController.instance.borderDraft,
        hideFrame: hideFrameData,
        resetFrame: resetFrameData)
        .obs;
  }

  hideFrameData() {
    ThirdFrameController.instance.frameDraft.hideFrame();
    ThirdLogoController.instance.logoDraft.hideLogo();
    ThirdNameController.instance.nameDraft.hideName();
    ThirdNumberController.instance.numberDraft.hideNumber();
    ThirdEmailController.instance.emailDraft.hideEmail();
    ThirdAddressController.instance.addressDraft.hideAddress();
  }

  resetFrameData() {
    ThirdLogoController.instance.logoDraft.resetLogo();
    ThirdFrameController.instance.frameDraft.resetFrame();
    ThirdNameController.instance.nameDraft.resetName();
    ThirdNumberController.instance.numberDraft.resetNumber();
    ThirdEmailController.instance.emailDraft.resetEmail();
    ThirdAddressController.instance.addressDraft.resetAddress();
    ThirdBorderController.instance.borderDraft.resetBorder();
  }
}
