import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/local/edit_poster_model.dart';
import '../../../../uttils/uttils.dart';

//==============================================================================
// ** First Email **
//==============================================================================

class FirstEmailController {
  static final FirstEmailController instance = FirstEmailController._internal();

  factory FirstEmailController() {
    return instance;
  }
  FirstEmailController._internal() {
    setEmailDraft();
  }

  late EmailDraft emailDraft;

  setEmailDraft() {
    emailDraft = EmailDraft(
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
        resetEmail: resetEmail,
        hideEmail: hideEmail);
    appPrint(emailDraft);
  }

  resetEmail() {
    var email = emailDraft;

    email.toolColor.opacity(1.0);
    email.textSize.size(8.sp);
    email.textSpace.space(0.0.sp);
    email.toolColor.color(AppColors.black);
    email.textFont.fontIndex(0);
    email.textFont.font("Philosopher-Regular");
  }

  hideEmail() {
    var email = emailDraft;
    if (email.preview.isTrue) {
      email.preview(false);
    } else {
      email.preview(true);
    }
  }
}

//==============================================================================
// ** Second Email **
//==============================================================================

class SecondEmailController {
  static final SecondEmailController instance =
      SecondEmailController._internal();

  factory SecondEmailController() {
    return instance;
  }
  SecondEmailController._internal() {
    setEmailDraft();
  }

  late EmailDraft emailDraft;

  setEmailDraft() {
    emailDraft = EmailDraft(
        preview: true.obs,
        textSize: TextSize(
          min: 6.5.sp.obs,
          max: 10.sp.obs,
          size: 6.5.sp.obs,
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
        resetEmail: resetEmail,
        hideEmail: hideEmail);
    appPrint(emailDraft);
  }

  resetEmail() {
    var email = emailDraft;
    email.toolColor.opacity(1.0);
    email.textSize.size(6.5.sp);
    email.textSpace.space(0.0.sp);
    email.toolColor.color(AppColors.black);
    email.textFont.fontIndex(0);
    email.textFont.font("Roboto-Regular");
  }

  hideEmail() {
    var email = emailDraft;
    if (email.preview.isTrue) {
      email.preview(false);
    } else {
      email.preview(true);
    }
  }
}

//==============================================================================
// ** Third Email **
//==============================================================================

class ThirdEmailController {
  static final ThirdEmailController instance = ThirdEmailController._internal();

  factory ThirdEmailController() {
    return instance;
  }
  ThirdEmailController._internal() {
    setEmailDraft();
  }

  late EmailDraft emailDraft;

  setEmailDraft() {
    emailDraft = EmailDraft(
        preview: true.obs,
        textSize: TextSize(
          min: 6.5.sp.obs,
          max: 10.sp.obs,
          size: 6.5.sp.obs,
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
        resetEmail: resetEmail,
        hideEmail: hideEmail);
    appPrint(emailDraft);
  }

  resetEmail() {
    var email = emailDraft;

    email.toolColor.opacity(1.0);
    email.textSize.size(6.5.sp);
    email.textSpace.space(0.0.sp);
    email.toolColor.color(AppColors.black);
    email.textFont.fontIndex(0);
    email.textFont.font("Roboto-Regular");
  }

  hideEmail() {
    var email = emailDraft;
    if (email.preview.isTrue) {
      email.preview(false);
    } else {
      email.preview(true);
    }
  }
}
