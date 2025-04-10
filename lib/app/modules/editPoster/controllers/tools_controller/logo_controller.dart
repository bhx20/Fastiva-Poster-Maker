import 'dart:math';

import 'package:festiva_poster/app/uttils/globle_uttils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/core.dart';
import '../../../../model/local/edit_poster_model.dart';
import 'address_controller.dart';

//==============================================================================
// ** First Logo **
//==============================================================================

class FirstLogoController {
  static final FirstLogoController instance = FirstLogoController._internal();

  factory FirstLogoController() {
    return instance;
  }
  FirstLogoController._internal() {
    setLogoDraft();
  }

  late LogoDraft logoDraft;

  setLogoDraft() {
    logoDraft = LogoDraft(
        toolColor: ToolColor(opacity: 1.0.obs, color: AppColors.trans.obs),
        opacity: 1.0.obs,
        minScale: 20.0.obs,
        maxScale: 200.0.obs,
        scaleSize: 65.0.obs,
        shapeList: [
          ShapeData(icon: AppIcon.round, isSelected: false.obs),
          ShapeData(icon: AppIcon.square, isSelected: false.obs),
        ],
        hPosition: 2.0.w.obs,
        vPosition: 3.5.h.obs,
        preview: true.obs,
        lock: false.obs,
        minOpacity: 0.0.obs,
        maxOpacity: 1.0.obs,
        toolRadius: ToolRadius(
          max: 100.0.obs,
          min: 0.0.obs,
          bottomLeft: 0.0.obs,
          bottomRight: 0.0.obs,
          topLeft: 0.0.obs,
          topRight: 0.0.obs,
        ),
        toolMargin: ToolMargin(
            min: 0.0.obs,
            max: 100.0.obs,
            bottom: 0.0.obs,
            left: 0.0.obs,
            top: 8.0.obs,
            right: 8.0.obs),
        toolBorder: ToolBorder(
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            color: AppColors.white.obs,
            opacity: 0.8.obs,
            strokeWidth: 3.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        resetLogo: resetLogo,
        hideLogo: hideLogo,
        updateLogoPosition: updateLogoPosition);

    logoDraft.shapeList.first.isSelected(true);
    logoDraft.shapeList.last.isSelected(false);
    appPrint(logoDraft);
  }

  resetLogo() {
    var logo = logoDraft;
    var address = FirstAddressController.instance.addressDraft;
    logo.hPosition(2.0.w);
    logo.vPosition(address.preview.isTrue ? 3.5.h : 2.5.h);
    logo.toolColor.opacity(1.0);
    logo.toolColor.opacity(1.0);
    logo.scaleSize(65.0);
    logo.toolColor.color(AppColors.trans);
    logo.shapeList.first.isSelected(true);
    logo.shapeList.last.isSelected(false);
    logo.toolBorder.color(AppColors.white);
    logo.toolBorder.strokeWidth(3.0);
    logo.toolBorder.opacity(0.8);
    logo.toolMargin.top(8.0);
    logo.toolMargin.bottom(0.0);
    logo.toolMargin.right(8.0);
    logo.toolMargin.left(0.0);
  }

  hideLogo() {
    var logo = logoDraft;
    if (logo.preview.isTrue) {
      logo.preview(false);
    } else {
      logo.preview(true);
    }
  }

  updateLogoPosition(DragUpdateDetails details) {
    var logo = logoDraft;
    logo.hPosition.value = max(0, logo.hPosition.value - details.delta.dx);
    logo.vPosition.value = max(0, logo.vPosition.value - details.delta.dy);
  }
}

//==============================================================================
// ** Second Logo **
//==============================================================================

class SecondLogoController {
  static final SecondLogoController instance = SecondLogoController._internal();

  factory SecondLogoController() {
    return instance;
  }
  SecondLogoController._internal() {
    setLogoDraft();
  }

  late LogoDraft logoDraft;

  setLogoDraft() {
    logoDraft = LogoDraft(
        toolColor: ToolColor(opacity: 1.0.obs, color: AppColors.trans.obs),
        opacity: 1.0.obs,
        minScale: 20.0.obs,
        maxScale: 200.0.obs,
        scaleSize: 40.0.obs,
        shapeList: [
          ShapeData(icon: AppIcon.round, isSelected: false.obs),
          ShapeData(icon: AppIcon.square, isSelected: false.obs),
        ],
        vPosition: 0.5.h.obs,
        hPosition: 0.5.h.obs,
        preview: true.obs,
        lock: false.obs,
        minOpacity: 0.0.obs,
        maxOpacity: 1.0.obs,
        toolRadius: ToolRadius(
          max: 100.0.obs,
          min: 0.0.obs,
          bottomLeft: 5.0.obs,
          bottomRight: 5.0.obs,
          topLeft: 5.0.obs,
          topRight: 5.0.obs,
        ),
        toolMargin: ToolMargin(
            min: 0.0.obs,
            max: 100.0.obs,
            bottom: 0.0.obs,
            left: 0.0.obs,
            top: 8.0.obs,
            right: 8.0.obs),
        toolBorder: ToolBorder(
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            color: AppColors.trans.obs,
            opacity: 0.8.obs,
            strokeWidth: 3.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        resetLogo: resetLogo,
        hideLogo: hideLogo,
        updateLogoPosition: updateLogoPosition);

    logoDraft.shapeList.first.isSelected(false);
    logoDraft.shapeList.last.isSelected(false);
    appPrint(logoDraft);
  }

  resetLogo() {
    var logo = logoDraft;
    logo.vPosition(0.5.h);
    logo.hPosition(0.5.h);
    logo.toolColor.opacity(1.0);
    logo.scaleSize(40.0);
    logo.toolColor.color(AppColors.trans);
    logo.shapeList.first.isSelected(false);
    logo.shapeList.last.isSelected(false);
    logo.toolRadius.topRight(5.0);
    logo.toolRadius.topLeft(5.0);
    logo.toolRadius.bottomRight(5.0);
    logo.toolRadius.bottomLeft(5.0);
    logo.toolBorder.color(AppColors.trans);
    logo.toolMargin.top(8.0);
    logo.toolMargin.bottom(0.0);
    logo.toolMargin.right(8.0);
    logo.toolMargin.left(0.0);
  }

  hideLogo() {
    var logo = logoDraft;
    if (logo.preview.isTrue) {
      logo.preview(false);
    } else {
      logo.preview(true);
    }
  }

  updateLogoPosition(DragUpdateDetails details) {
    var logo = logoDraft;
    logo.hPosition.value = max(0, logo.hPosition.value - details.delta.dx);
    logo.vPosition.value = max(0, logo.vPosition.value + details.delta.dy);
  }
}

//==============================================================================
// ** Third Logo **
//==============================================================================

class ThirdLogoController {
  static final ThirdLogoController instance = ThirdLogoController._internal();

  factory ThirdLogoController() {
    return instance;
  }
  ThirdLogoController._internal() {
    setLogoDraft();
  }

  late LogoDraft logoDraft;

  setLogoDraft() {
    logoDraft = LogoDraft(
        toolColor: ToolColor(opacity: 1.0.obs, color: AppColors.trans.obs),
        opacity: 1.0.obs,
        minScale: 20.0.obs,
        maxScale: 200.0.obs,
        scaleSize: 70.0.obs,
        shapeList: [
          ShapeData(icon: AppIcon.round, isSelected: false.obs),
          ShapeData(icon: AppIcon.square, isSelected: false.obs),
        ],
        hPosition: 1.0.h.obs,
        vPosition: 1.2.h.obs,
        preview: true.obs,
        lock: false.obs,
        minOpacity: 0.0.obs,
        maxOpacity: 1.0.obs,
        toolRadius: ToolRadius(
          max: 100.0.obs,
          min: 0.0.obs,
          bottomLeft: 5.0.obs,
          bottomRight: 5.0.obs,
          topLeft: 5.0.obs,
          topRight: 5.0.obs,
        ),
        toolMargin: ToolMargin(
            min: 0.0.obs,
            max: 100.0.obs,
            bottom: 0.0.obs,
            left: 0.0.obs,
            top: 8.0.obs,
            right: 8.0.obs),
        toolBorder: ToolBorder(
            strokeWidthMax: 10.0.obs,
            strokeWidthMin: 0.0.obs,
            color: AppColors.white.obs,
            opacity: 1.0.obs,
            strokeWidth: 3.0.obs,
            opacityMin: 0.0.obs,
            opacityMax: 1.0.obs),
        resetLogo: resetLogo,
        hideLogo: hideLogo,
        updateLogoPosition: updateLogoPosition);

    logoDraft.shapeList.first.isSelected(true);
    logoDraft.shapeList.last.isSelected(false);
    appPrint(logoDraft);
  }

  resetLogo() {
    var logo = logoDraft;
    logo.vPosition(1.2.h);
    logo.hPosition(1.h);
    logo.toolColor.opacity(1.0);
    logo.scaleSize(70.0);
    logo.toolColor.color(AppColors.trans);
    logo.shapeList.first.isSelected(true);
    logo.shapeList.last.isSelected(false);
    logo.toolRadius.topRight(5.0);
    logo.toolRadius.topLeft(5.0);
    logo.toolRadius.bottomRight(5.0);
    logo.toolRadius.bottomLeft(5.0);
    logo.toolBorder.color(AppColors.white);
    logo.toolBorder.opacity(1.0);
    logo.toolMargin.top(8.0);
    logo.toolMargin.bottom(0.0);
    logo.toolMargin.right(8.0);
    logo.toolMargin.left(0.0);
  }

  hideLogo() {
    var logo = logoDraft;
    if (logo.preview.isTrue) {
      logo.preview(false);
    } else {
      logo.preview(true);
    }
  }

  updateLogoPosition(DragUpdateDetails details) {
    var logo = logoDraft;
    logo.hPosition.value = max(0, logo.hPosition.value + details.delta.dx);
    logo.vPosition.value = max(0, logo.vPosition.value - details.delta.dy);
  }
}
