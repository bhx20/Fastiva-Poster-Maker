import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../model/local/edit_poster_model.dart';
import '../../../../uttils/uttils.dart';

//==============================================================================
// ** First Border **
//==============================================================================

class FirstBorderController {
  static final FirstBorderController instance =
      FirstBorderController._internal();

  factory FirstBorderController() {
    return instance;
  }
  FirstBorderController._internal() {
    setBorderDraft();
  }

  late FrameBorderDraft borderDraft;

  setBorderDraft() {
    borderDraft = FrameBorderDraft(
        frameBorder: ToolBorder(
            color: AppColors.trans.obs,
            opacity: 1.0.obs,
            strokeWidth: 0.0.obs,
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        resetBorder: resetBorder);
    appPrint(borderDraft);
  }

  resetBorder() {
    var border = borderDraft;
    border.frameBorder.color(AppColors.trans);
    border.frameBorder.opacity(1.0);
    border.frameBorder.strokeWidth(0.0);
  }
}

//==============================================================================
// ** Second Border **
//==============================================================================

class SecondBorderController {
  static final SecondBorderController instance =
      SecondBorderController._internal();

  factory SecondBorderController() {
    return instance;
  }
  SecondBorderController._internal() {
    setBorderDraft();
  }

  late FrameBorderDraft borderDraft;

  setBorderDraft() {
    borderDraft = FrameBorderDraft(
        frameBorder: ToolBorder(
            color: AppColors.trans.obs,
            opacity: 1.0.obs,
            strokeWidth: 0.0.obs,
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        resetBorder: resetBorder);
    appPrint(borderDraft);
  }

  resetBorder() {
    var border = borderDraft;
    border.frameBorder.color(AppColors.trans);
    border.frameBorder.opacity(1.0);
    border.frameBorder.strokeWidth(0.0);
  }
}


//==============================================================================
// ** Third Border **
//==============================================================================

class ThirdBorderController {
  static final ThirdBorderController instance =
  ThirdBorderController._internal();

  factory ThirdBorderController() {
    return instance;
  }
  ThirdBorderController._internal() {
    setBorderDraft();
  }

  late FrameBorderDraft borderDraft;

  setBorderDraft() {
    borderDraft = FrameBorderDraft(
        frameBorder: ToolBorder(
            color: AppColors.trans.obs,
            opacity: 1.0.obs,
            strokeWidth: 0.0.obs,
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        resetBorder: resetBorder);
    appPrint(borderDraft);
  }

  resetBorder() {
    var border = borderDraft;
    border.frameBorder.color(AppColors.trans);
    border.frameBorder.opacity(1.0);
    border.frameBorder.strokeWidth(0.0);
  }
}
