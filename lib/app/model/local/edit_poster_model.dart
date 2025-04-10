import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FrameSettings {
  late List<ToolManu>? toolManuList;
  late LogoDraft? logo;
  late FrameDraft? frame;
  late NameDraft? name;
  late NumberDraft? number;
  late EmailDraft? email;
  late AddressDraft? address;
  late FrameBorderDraft? border;
  late RxBool isFrame;
  late RxBool removeWaterMark;
  late dynamic resetFrame;
  late dynamic hideFrame;

  FrameSettings({
    this.toolManuList,
    this.logo,
    this.frame,
    this.name,
    this.number,
    this.email,
    this.address,
    this.border,
    this.resetFrame,
    this.hideFrame,
  })  : isFrame = true.obs,
        removeWaterMark = false.obs;
}

//==============================================================================
// ** Parent Model Class **
//==============================================================================

class ToolManu {
  final String title;
  final String route;

  ToolManu({required this.title, required this.route});
}

class ShapeData {
  final String icon;
  final RxBool isSelected;

  ShapeData({required this.icon, required this.isSelected});
}

class LogoDraft {
  late RxBool preview;
  late RxBool lock;
  late RxDouble minOpacity;
  late RxDouble maxOpacity;
  late RxDouble opacity;
  late RxDouble minScale;
  late RxDouble maxScale;
  late RxDouble scaleSize;
  late ToolColor toolColor;
  late List<ShapeData> shapeList;
  late ToolRadius toolRadius;
  late ToolMargin toolMargin;
  late ToolBorder toolBorder;
  late RxDouble vPosition;
  late RxDouble hPosition;
  late dynamic resetLogo;
  late dynamic hideLogo;
  late dynamic updateLogoPosition;

  LogoDraft({
    required this.opacity,
    required this.minScale,
    required this.maxScale,
    required this.scaleSize,
    required this.shapeList,
    required this.vPosition,
    required this.hPosition,
    required this.preview,
    required this.lock,
    required this.minOpacity,
    required this.maxOpacity,
    required this.toolColor,
    required this.toolRadius,
    required this.toolMargin,
    required this.toolBorder,
    required this.resetLogo,
    required this.hideLogo,
    required this.updateLogoPosition,
  });
}

class FrameDraft {
  late RxBool preview;
  late RxBool lock;
  late RxDouble fixBottom;
  late RxDouble minOpacity;
  late RxDouble maxOpacity;
  late RxDouble opacity;
  late RxDouble minHeight;
  late RxDouble maxHeight;
  late RxDouble height;
  late ToolColor toolColor;
  late ToolRadius toolRadius;
  late RxDouble minNameBox;
  late RxDouble maxNameBox;
  late RxDouble nameBoxRadius;
  late ToolMargin tooMargin;
  late ToolBorder toolBorder;
  late dynamic resetFrame;
  late dynamic hideFrame;
  late dynamic updateFramePosition;

  FrameDraft({
    required this.preview,
    required this.lock,
    required this.fixBottom,
    required this.minOpacity,
    required this.maxOpacity,
    required this.opacity,
    required this.minHeight,
    required this.maxHeight,
    required this.height,
    required this.toolColor,
    required this.toolRadius,
    required this.minNameBox,
    required this.maxNameBox,
    required this.nameBoxRadius,
    required this.tooMargin,
    required this.toolBorder,
    required this.resetFrame,
    required this.hideFrame,
    required this.updateFramePosition,
  });
}

class NameDraft {
  late RxBool preview;
  late RxBool lock;
  late TextSize textSize;
  late TextSpace textSpace;
  late ToolColor toolColor;
  late TextFont textFont;
  late RxDouble fixBottom;
  late RxDouble opacityMin;
  late RxDouble opacityMax;
  late dynamic resetName;
  late dynamic hideName;
  late dynamic updateNamePosition;

  NameDraft(
      {required this.preview,
      required this.lock,
      required this.textSize,
      required this.textSpace,
      required this.toolColor,
      required this.textFont,
      required this.fixBottom,
      required this.opacityMin,
      required this.opacityMax,
      required this.resetName,
      required this.hideName,
      required this.updateNamePosition});
}

class NumberDraft {
  late RxBool preview;
  late TextSize textSize;
  late TextSpace textSpace;
  late ToolColor toolColor;
  late TextFont textFont;
  late dynamic resetNumber;
  late dynamic hideNumber;

  NumberDraft({
    required this.preview,
    required this.textSize,
    required this.textSpace,
    required this.toolColor,
    required this.textFont,
    required this.resetNumber,
    required this.hideNumber,
  });
}

class EmailDraft {
  late RxBool preview;
  late TextSize textSize;
  late TextSpace textSpace;
  late ToolColor toolColor;
  late TextFont textFont;
  late dynamic resetEmail;
  late dynamic hideEmail;

  EmailDraft({
    required this.preview,
    required this.textSize,
    required this.textSpace,
    required this.toolColor,
    required this.textFont,
    required this.resetEmail,
    required this.hideEmail,
  });
}

class AddressDraft {
  late RxBool preview;
  late TextSize textSize;
  late TextSpace textSpace;
  late ToolColor toolColor;
  late TextFont textFont;
  late dynamic resetAddress;
  late dynamic hideAddress;

  AddressDraft({
    required this.preview,
    required this.textSize,
    required this.textSpace,
    required this.toolColor,
    required this.textFont,
    required this.resetAddress,
    required this.hideAddress,
  });
}

class FrameBorderDraft {
  late ToolBorder frameBorder;
  late dynamic resetBorder;
  FrameBorderDraft({
    required this.frameBorder,
    required this.resetBorder,
  });
}

//==============================================================================
// ** Child Model Class **
//==============================================================================

/// common color class
class ToolColor {
  late Rx<Color> color;
  late RxDouble opacity;
  ToolColor({required this.color, required this.opacity});
}

/// common radius class
class ToolRadius {
  late RxDouble topLeft;
  late RxDouble topRight;
  late RxDouble bottomLeft;
  late RxDouble bottomRight;
  late RxDouble min;
  late RxDouble max;

  ToolRadius(
      {required this.topLeft,
      required this.topRight,
      required this.bottomLeft,
      required this.bottomRight,
      required this.min,
      required this.max});
}

/// common margin class
class ToolMargin {
  late RxDouble top;
  late RxDouble bottom;
  late RxDouble right;
  late RxDouble left;
  late RxDouble min;
  late RxDouble max;

  ToolMargin({
    required this.top,
    required this.bottom,
    required this.right,
    required this.left,
    required this.min,
    required this.max,
  });
}

/// common border class
class ToolBorder {
  late Rx<Color> color;
  late RxDouble opacity;
  late RxDouble strokeWidth;
  late RxDouble strokeWidthMin;
  late RxDouble strokeWidthMax;
  late RxDouble opacityMax;
  late RxDouble opacityMin;

  ToolBorder({
    required this.color,
    required this.opacity,
    required this.strokeWidth,
    required this.strokeWidthMax,
    required this.strokeWidthMin,
    required this.opacityMin,
    required this.opacityMax,
  });
}

/// Text classes
class TextSize {
  late RxDouble min;
  late RxDouble max;
  late RxDouble size;

  TextSize({
    required this.min,
    required this.max,
    required this.size,
  });
}

class TextSpace {
  late RxDouble min;
  late RxDouble max;
  late RxDouble space;

  TextSpace({
    required this.min,
    required this.max,
    required this.space,
  });
}

class TextFont {
  late RxInt fontIndex;
  late RxString font;

  TextFont({
    required this.fontIndex,
    required this.font,
  });
}
