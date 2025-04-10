import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

TextStyle poppins = const TextStyle(fontFamily: TextFontFamily.poppins);

class TextFontFamily {
//==============================================================================
// ** Font Names **
//==============================================================================

  static const String poppins = "Poppins";
}

extension TextStyleExtensions on TextStyle {
//==============================================================================
// ** Common Weight **
//==============================================================================
  TextStyle get bold => weight(FontWeight.w700);

  TextStyle get normal => weight(FontWeight.w400);

  TextStyle get thin => weight(FontWeight.w100);

//==============================================================================
// ** FontSize **
//==============================================================================
  TextStyle size(double v) => copyWith(fontSize: v);

  TextStyle get get3 => size(3.sp);
  TextStyle get get4 => size(4.sp);

  TextStyle get get5 => size(5.sp);

  TextStyle get get6 => size(6.sp);
  TextStyle get get7 => size(7.sp);

  TextStyle get get8 => size(8.sp);
  TextStyle get get9 => size(9.sp);

  TextStyle get get10 => size(10.sp);

  TextStyle get get11 => size(11.sp);

  TextStyle get get12 => size(12.sp);

  TextStyle get get13 => size(13.sp);

  TextStyle get get14 => size(14.sp);

  TextStyle get get15 => size(15.sp);

  TextStyle get get16 => size(16.sp);

  TextStyle get get17 => size(17.sp);

  TextStyle get get18 => size(18.sp);

  TextStyle get get19 => size(19.sp);

  TextStyle get get20 => size(20.sp);

  TextStyle get get21 => size(21.sp);

  TextStyle get get22 => size(22.sp);

  TextStyle get get23 => size(23.sp);

  TextStyle get get24 => size(24.sp);

  TextStyle get get25 => size(25.sp);

  TextStyle get get26 => size(26.sp);

  TextStyle get get27 => size(27.sp);

  TextStyle get get28 => size(28.sp);

  TextStyle get get29 => size(29.sp);

  TextStyle get get30 => size(30.sp);

  TextStyle get get31 => size(31.sp);

  TextStyle get get32 => size(32.sp);

  TextStyle get get33 => size(33.sp);

  TextStyle get get34 => size(34.sp);

  TextStyle get get35 => size(35.sp);

  TextStyle get get36 => size(36.sp);

  TextStyle get get37 => size(37.sp);

  TextStyle get get38 => size(38.sp);

  TextStyle get get39 => size(39.sp);

  TextStyle get get40 => size(40.sp);
  TextStyle get get48 => size(48.sp);
  TextStyle get get50 => size(50.sp);

//==============================================================================
// ** FontWeight **
//==============================================================================
  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  TextStyle get w100 => weight(FontWeight.w100);
  TextStyle get w200 => weight(FontWeight.w200);
  TextStyle get w300 => weight(FontWeight.w300);
  TextStyle get w400 => weight(FontWeight.w400);
  TextStyle get w500 => weight(FontWeight.w500);
  TextStyle get w600 => weight(FontWeight.w600);
  TextStyle get w700 => weight(FontWeight.w700);
  TextStyle get w800 => weight(FontWeight.w800);
  TextStyle get w900 => weight(FontWeight.w900);

//==============================================================================
// ** TextColor **
//==============================================================================
  TextStyle textColor(Color v) => copyWith(color: v);

  TextStyle get black => textColor(AppColors.black);
  TextStyle get grey => textColor(AppColors.grey);
  TextStyle get white => textColor(AppColors.white);
  TextStyle get appColor => textColor(AppColors.appColor);

//==============================================================================
// ** letterSpace **
//==============================================================================
  TextStyle letterSpace(double v) => copyWith(letterSpacing: v);
  TextStyle get space01 => letterSpace(0.1);
  TextStyle get space02 => letterSpace(0.2);
  TextStyle get space03 => letterSpace(0.3);
  TextStyle get space04 => letterSpace(0.4);
  TextStyle get space05 => letterSpace(0.5);
  TextStyle get space06 => letterSpace(0.6);
  TextStyle get space07 => letterSpace(0.7);
  TextStyle get space08 => letterSpace(0.8);
  TextStyle get space09 => letterSpace(0.9);
  TextStyle get space10 => letterSpace(1);
  TextStyle get space11 => letterSpace(1.1);
  TextStyle get space12 => letterSpace(1.2);
  TextStyle get space13 => letterSpace(1.3);
  TextStyle get space14 => letterSpace(1.4);
  TextStyle get space15 => letterSpace(1.5);
  TextStyle get space16 => letterSpace(1.6);
  TextStyle get space17 => letterSpace(1.7);
  TextStyle get space18 => letterSpace(1.8);
  TextStyle get space19 => letterSpace(1.9);
  TextStyle get space20 => letterSpace(2.0);

//==============================================================================
// ** TextHeight **
//==============================================================================
  TextStyle textHeight(double v) => copyWith(height: v);
  TextStyle textDecoration(TextDecoration v) => copyWith(decoration: v);
  TextStyle decorationColor(Color v) => copyWith(decorationColor: v);
  TextStyle textDecorationColor(Color color) =>
      copyWith(decorationColor: color);

//==============================================================================
// **  Custom TextStyle **
//==============================================================================
  TextStyle customStyle({
    double? letterSpacing,
    double? fontSize,
    FontWeight? weight,
  }) =>
      copyWith(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: weight,
      );
}
