import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/local/edit_poster_model.dart';
import '../../../../uttils/uttils.dart';
import 'address_controller.dart';

//==============================================================================
// ** First Frame **
//==============================================================================

class FirstFrameController {
  static final FirstFrameController instance = FirstFrameController._internal();

  factory FirstFrameController() {
    return instance;
  }
  FirstFrameController._internal() {
    setFrameDraft();
  }
  late FrameDraft frameDraft;

  setFrameDraft() {
    frameDraft = FrameDraft(
        preview: true.obs,
        lock: false.obs,
        minOpacity: 0.0.obs,
        maxOpacity: 1.0.obs,
        opacity: 0.8.obs,
        minHeight: 2.5.h.obs,
        maxHeight: 10.h.obs,
        height: 7.h.obs,
        toolColor: ToolColor(color: AppColors.white.obs, opacity: 0.8.obs),
        toolRadius: ToolRadius(
            topLeft: 0.0.obs,
            topRight: 0.0.obs,
            bottomLeft: 0.0.obs,
            bottomRight: 0.0.obs,
            min: 0.0.obs,
            max: 50.0.obs),
        minNameBox: 0.0.obs,
        maxNameBox: 50.0.obs,
        nameBoxRadius: 50.0.obs,
        tooMargin: ToolMargin(
            top: 0.0.obs,
            bottom: 8.0.obs,
            right: 0.0.obs,
            left: 0.0.obs,
            min: 0.0.obs,
            max: 100.0.obs),
        toolBorder: ToolBorder(
            color: AppColors.trans.obs,
            opacity: 1.0.obs,
            strokeWidth: 0.0.obs,
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        fixBottom: 0.0.obs,
        hideFrame: hideFrame,
        resetFrame: resetFrame,
        updateFramePosition: updateFramePosition);
    appPrint(frameDraft);
  }

  void updateFramePosition(DragUpdateDetails details) {
    var frame = frameDraft;
    frame.fixBottom.value = max(0, frame.fixBottom.value - details.delta.dy);
  }

  resetFrame() {
    var frame = frameDraft;
    var address = FirstAddressController.instance.addressDraft;
    frame.fixBottom(0.0);
    frame.height(address.preview.isTrue ? 7.h : 5.h);
    frame.toolColor.opacity(0.8);
    frame.toolColor.color(AppColors.white.withOpacity(0.5));
    frame.toolRadius.topRight(0.0);
    frame.toolRadius.topLeft(0.0);
    frame.toolRadius.bottomRight(0.0);
    frame.toolRadius.bottomLeft(0.0);
    frame.tooMargin.right(0.0);
    frame.tooMargin.left(0.0);
    frame.tooMargin.top(0.0);
    frame.tooMargin.bottom(8.0);
    frame.toolBorder.color(AppColors.trans);
    frame.toolBorder.strokeWidth(0.0);
    frame.toolBorder.opacity(1.0);
  }

  hideFrame() {
    var frame = frameDraft;
    if (frame.preview.isTrue) {
      frame.preview(false);
    } else {
      frame.preview(true);
    }
  }
}

//==============================================================================
// ** Second Frame **
//==============================================================================

class SecondFrameController {
  static final SecondFrameController instance =
      SecondFrameController._internal();

  factory SecondFrameController() {
    return instance;
  }
  SecondFrameController._internal() {
    setFrameDraft();
  }
  late FrameDraft frameDraft;

  setFrameDraft() {
    frameDraft = FrameDraft(
        preview: true.obs,
        lock: false.obs,
        minOpacity: 0.0.obs,
        maxOpacity: 1.0.obs,
        opacity: 0.8.obs,
        minHeight: 1.h.obs,
        maxHeight: 10.h.obs,
        height: 3.h.obs,
        toolColor: ToolColor(color: AppColors.white.obs, opacity: 1.0.obs),
        toolRadius: ToolRadius(
            topLeft: 0.0.obs,
            topRight: 0.0.obs,
            bottomLeft: 0.0.obs,
            bottomRight: 0.0.obs,
            min: 0.0.obs,
            max: 50.0.obs),
        minNameBox: 0.0.obs,
        maxNameBox: 50.0.obs,
        nameBoxRadius: 5.0.obs,
        tooMargin: ToolMargin(
            top: 0.0.obs,
            bottom: 8.0.obs,
            right: 0.0.obs,
            left: 0.0.obs,
            min: 0.0.obs,
            max: 100.0.obs),
        toolBorder: ToolBorder(
            color: AppColors.trans.obs,
            opacity: 1.0.obs,
            strokeWidth: 0.0.obs,
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        fixBottom: 0.0.obs,
        hideFrame: hideFrame,
        resetFrame: resetFrame,
        updateFramePosition: updateFramePosition);
    appPrint(frameDraft);
  }

  void updateFramePosition(DragUpdateDetails details) {
    var frame = frameDraft;
    frame.fixBottom.value = max(0, frame.fixBottom.value - details.delta.dy);
  }

  resetFrame() {
    var frame = frameDraft;
    frame.fixBottom(0.0);
    frame.height(3.h);
    frame.toolColor.opacity(1.0);
    frame.toolColor.color(AppColors.white);
    frame.toolRadius.topRight(0.0);
    frame.toolRadius.topLeft(0.0);
    frame.toolRadius.bottomRight(0.0);
    frame.toolRadius.bottomLeft(0.0);
    frame.tooMargin.right(0.0);
    frame.tooMargin.left(0.0);
    frame.tooMargin.top(0.0);
    frame.tooMargin.bottom(8.0);
    frame.toolBorder.color(AppColors.trans);
    frame.toolBorder.strokeWidth(0.0);
    frame.toolBorder.opacity(1.0);
  }

  hideFrame() {
    var frame = frameDraft;
    if (frame.preview.isTrue) {
      frame.preview(false);
    } else {
      frame.preview(true);
    }
  }
}

//==============================================================================
// ** Third Frame **
//==============================================================================

class ThirdFrameController {
  static final ThirdFrameController instance = ThirdFrameController._internal();

  factory ThirdFrameController() {
    return instance;
  }
  ThirdFrameController._internal() {
    setFrameDraft();
  }
  late FrameDraft frameDraft;

  setFrameDraft() {
    frameDraft = FrameDraft(
        preview: true.obs,
        lock: false.obs,
        minOpacity: 0.0.obs,
        maxOpacity: 1.0.obs,
        opacity: 0.8.obs,
        minHeight: 1.h.obs,
        maxHeight: 10.h.obs,
        height: 6.h.obs,
        toolColor: ToolColor(color: AppColors.white.obs, opacity: 1.0.obs),
        toolRadius: ToolRadius(
            topLeft: 0.0.obs,
            topRight: 0.0.obs,
            bottomLeft: 0.0.obs,
            bottomRight: 0.0.obs,
            min: 0.0.obs,
            max: 50.0.obs),
        minNameBox: 0.0.obs,
        maxNameBox: 50.0.obs,
        nameBoxRadius: 5.0.obs,
        tooMargin: ToolMargin(
            top: 0.0.obs,
            bottom: 2.2.h.obs,
            right: 0.0.obs,
            left: 0.0.obs,
            min: 0.0.obs,
            max: 100.0.obs),
        toolBorder: ToolBorder(
            color: AppColors.trans.obs,
            opacity: 1.0.obs,
            strokeWidth: 0.0.obs,
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        fixBottom: 0.0.obs,
        hideFrame: hideFrame,
        resetFrame: resetFrame,
        updateFramePosition: updateFramePosition);
    appPrint(frameDraft);
  }

  void updateFramePosition(DragUpdateDetails details) {
    var frame = frameDraft;
    frame.fixBottom.value = max(0, frame.fixBottom.value - details.delta.dy);
  }

  resetFrame() {
    var frame = frameDraft;
    frame.fixBottom(0.0);
    frame.height(6.h);
    frame.toolColor.opacity(1.0);
    frame.toolColor.color(AppColors.white);
    frame.toolRadius.topRight(0.0);
    frame.toolRadius.topLeft(0.0);
    frame.toolRadius.bottomRight(0.0);
    frame.toolRadius.bottomLeft(0.0);
    frame.tooMargin.right(0.0);
    frame.tooMargin.left(0.0);
    frame.tooMargin.top(0.0);
    frame.tooMargin.bottom(2.2.h);
    frame.toolBorder.color(AppColors.trans);
    frame.toolBorder.strokeWidth(0.0);
    frame.toolBorder.opacity(1.0);
  }

  hideFrame() {
    var frame = frameDraft;
    if (frame.preview.isTrue) {
      frame.preview(false);
    } else {
      frame.preview(true);
    }
  }
}
