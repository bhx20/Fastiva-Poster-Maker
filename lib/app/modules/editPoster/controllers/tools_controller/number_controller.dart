import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/local/edit_poster_model.dart';
import '../../../../uttils/uttils.dart';

//==============================================================================
// ** First Number **
//==============================================================================

class FirstNumberController {
  static final FirstNumberController instance =
      FirstNumberController._internal();

  factory FirstNumberController() {
    return instance;
  }
  FirstNumberController._internal() {
    setNumberDraft();
  }

  late NumberDraft numberDraft;

  setNumberDraft() {
    numberDraft = NumberDraft(
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
        hideNumber: hideNumber,
        resetNumber: resetNumber);
    appPrint(numberDraft);
  }

  resetNumber() {
    var number = numberDraft;
    number.toolColor.opacity(1.0);
    number.textSize.size(8.sp);
    number.textSpace.space(0.0.sp);
    number.toolColor.color(AppColors.black);
    number.textFont.fontIndex(0);
    number.textFont.font("Philosopher-Regular");
  }

  hideNumber() {
    var number = numberDraft;
    if (number.preview.isTrue) {
      number.preview(false);
    } else {
      number.preview(true);
    }
  }
}

//==============================================================================
// ** Second Number **
//==============================================================================

class SecondNumberController {
  static final SecondNumberController instance =
      SecondNumberController._internal();

  factory SecondNumberController() {
    return instance;
  }
  SecondNumberController._internal() {
    setNumberDraft();
  }

  late NumberDraft numberDraft;

  setNumberDraft() {
    numberDraft = NumberDraft(
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
        hideNumber: hideNumber,
        resetNumber: resetNumber);
    appPrint(numberDraft);
  }

  resetNumber() {
    var number = numberDraft;
    number.toolColor.opacity(1.0);
    number.textSize.size(6.5.sp);
    number.textSpace.space(0.0.sp);
    number.toolColor.color(AppColors.black);
    number.textFont.fontIndex(0);
    number.textFont.font("Roboto-Regular");
  }

  hideNumber() {
    var number = numberDraft;
    if (number.preview.isTrue) {
      number.preview(false);
    } else {
      number.preview(true);
    }
  }
}

//==============================================================================
// ** Third Number **
//==============================================================================

class ThirdNumberController {
  static final ThirdNumberController instance =
      ThirdNumberController._internal();

  factory ThirdNumberController() {
    return instance;
  }
  ThirdNumberController._internal() {
    setNumberDraft();
  }

  late NumberDraft numberDraft;

  setNumberDraft() {
    numberDraft = NumberDraft(
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
        hideNumber: hideNumber,
        resetNumber: resetNumber);
    appPrint(numberDraft);
  }

  resetNumber() {
    var number = numberDraft;
    number.toolColor.opacity(1.0);
    number.textSize.size(6.5.sp);
    number.textSpace.space(0.0.sp);
    number.toolColor.color(AppColors.black);
    number.textFont.fontIndex(0);
    number.textFont.font("Roboto-Regular");
  }

  hideNumber() {
    var number = numberDraft;
    if (number.preview.isTrue) {
      number.preview(false);
    } else {
      number.preview(true);
    }
  }
}
