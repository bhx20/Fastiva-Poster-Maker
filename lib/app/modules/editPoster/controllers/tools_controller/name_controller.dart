import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/local/edit_poster_model.dart';
import '../../../../uttils/uttils.dart';

//==============================================================================
// ** First Name **
//==============================================================================

class FirstNameController {
  static final FirstNameController instance = FirstNameController._internal();

  factory FirstNameController() {
    return instance;
  }
  FirstNameController._internal() {
    setNameDraft();
  }

  late NameDraft nameDraft;

  setNameDraft() {
    nameDraft = NameDraft(
      preview: true.obs,
      lock: false.obs,
      textSize: TextSize(
        min: 6.5.sp.obs,
        max: 10.sp.obs,
        size: 8.sp.obs,
      ),
      textSpace: TextSpace(
        max: 2.0.sp.obs,
        min: 0.0.sp.obs,
        space: 0.0.sp.obs,
      ),
      toolColor: ToolColor(
        color: AppColors.black.obs,
        opacity: 1.0.obs,
      ),
      textFont: TextFont(
        font: "Philosopher-Regular".obs,
        fontIndex: 0.obs,
      ),
      fixBottom: 8.h.obs,
      opacityMin: 0.0.obs,
      opacityMax: 1.0.obs,
      hideName: hideName,
      resetName: resetName,
      updateNamePosition: updateNamePosition,
    );
    appPrint(nameDraft);
  }

  void updateNamePosition(DragUpdateDetails details) {
    var name = nameDraft;
    name.fixBottom.value = max(0, name.fixBottom.value - details.delta.dy);
  }

  resetName() {
    var name = nameDraft;
    name.fixBottom(8.h);
    name.toolColor.opacity(1.0);
    name.textSize.size(8.0.sp);
    name.textSpace.space(0.0.sp);
    name.toolColor.color(AppColors.black);
    name.textFont.fontIndex(0);
    name.textFont.font("Philosopher-Regular");
  }

  hideName() {
    var name = nameDraft;
    if (name.preview.isTrue) {
      name.preview(false);
    } else {
      name.preview(true);
    }
  }
}

//==============================================================================
// ** Second Name **
//==============================================================================

class SecondNameController {
  static final SecondNameController instance = SecondNameController._internal();

  factory SecondNameController() {
    return instance;
  }
  SecondNameController._internal() {
    setNameDraft();
  }

  late NameDraft nameDraft;

  setNameDraft() {
    nameDraft = NameDraft(
      preview: false.obs,
      lock: false.obs,
      textSize: TextSize(
        min: 6.5.sp.obs,
        max: 10.sp.obs,
        size: 6.5.sp.obs,
      ),
      textSpace: TextSpace(
        max: 2.0.sp.obs,
        min: 0.0.sp.obs,
        space: 0.0.sp.obs,
      ),
      toolColor: ToolColor(
        color: AppColors.black.obs,
        opacity: 1.0.obs,
      ),
      textFont: TextFont(
        font: "Roboto-Regular".obs,
        fontIndex: 0.obs,
      ),
      fixBottom: 3.5.h.obs,
      opacityMin: 0.0.obs,
      opacityMax: 1.0.obs,
      hideName: hideName,
      resetName: resetName,
      updateNamePosition: updateNamePosition,
    );
    appPrint(nameDraft);
  }

  void updateNamePosition(DragUpdateDetails details) {
    var name = nameDraft;
    name.fixBottom.value = max(0, name.fixBottom.value - details.delta.dy);
  }

  resetName() {
    var name = nameDraft;
    name.preview(false);
    name.fixBottom(3.5.h);
    name.toolColor.opacity(1.0);
    name.textSize.size(6.5.sp);
    name.textSpace.space(0.0.sp);
    name.toolColor.color(AppColors.black);
    name.textFont.fontIndex(0);
    name.textFont.font("Roboto-Regular");
  }

  hideName() {
    var name = nameDraft;
    name.preview(true);
    if (name.preview.isTrue) {
      name.preview(false);
    } else {
      name.preview(true);
    }
  }
}

//==============================================================================
// ** Third Name **
//==============================================================================

class ThirdNameController {
  static final ThirdNameController instance = ThirdNameController._internal();

  factory ThirdNameController() {
    return instance;
  }
  ThirdNameController._internal() {
    setNameDraft();
  }

  late NameDraft nameDraft;

  setNameDraft() {
    nameDraft = NameDraft(
      preview: true.obs,
      lock: false.obs,
      textSize: TextSize(
        min: 6.5.sp.obs,
        max: 10.sp.obs,
        size: 8.sp.obs,
      ),
      textSpace: TextSpace(
        max: 2.0.sp.obs,
        min: 0.0.sp.obs,
        space: 0.0.sp.obs,
      ),
      toolColor: ToolColor(
        color: AppColors.black.obs,
        opacity: 1.0.obs,
      ),
      textFont: TextFont(
        font: "Roboto-Regular".obs,
        fontIndex: 0.obs,
      ),
      fixBottom: 9.5.h.obs,
      opacityMin: 0.0.obs,
      opacityMax: 1.0.obs,
      hideName: hideName,
      resetName: resetName,
      updateNamePosition: updateNamePosition,
    );
    appPrint(nameDraft);
  }

  void updateNamePosition(DragUpdateDetails details) {
    var name = nameDraft;
    name.fixBottom.value = max(0, name.fixBottom.value - details.delta.dy);
  }

  resetName() {
    var name = nameDraft;
    name.preview(true);
    name.fixBottom(9.5.h);
    name.toolColor.opacity(1.0);
    name.textSize.size(8.sp);
    name.textSpace.space(0.0.sp);
    name.toolColor.color(AppColors.black);
    name.textFont.fontIndex(0);
    name.textFont.font("Roboto-Regular");
  }

  hideName() {
    var name = nameDraft;
    name.preview(true);
    if (name.preview.isTrue) {
      name.preview(false);
    } else {
      name.preview(true);
    }
  }
}
