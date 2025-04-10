import 'package:festiva_poster/app/core/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

//==============================================================================
// ** Custom Theme  **
//==============================================================================
final ThemeData customTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: TextFontFamily.poppins,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.white.withOpacity(0.08),
    appBarTheme: _appBarTheme(),
    bottomNavigationBarTheme: _bottomBarTheme(),
    iconTheme: _iconThem(),
    dividerTheme: _dividerTheme(),
    progressIndicatorTheme: _loaderTheme(),
    tabBarTheme: _tabTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    outlinedButtonTheme: _outlineButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    primaryIconTheme: _iconThem());

//==============================================================================
// ** Helper Function  **
//==============================================================================

TextButtonThemeData _textButtonTheme() =>
    const TextButtonThemeData(style: ButtonStyle());

OutlinedButtonThemeData _outlineButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.appColor),
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

ElevatedButtonThemeData _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.appColor,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

TabBarTheme _tabTheme() {
  return const TabBarTheme(
    labelColor: AppColors.black,
    unselectedLabelColor: AppColors.black,
    indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2.0,
          color: AppColors.appColor,
        ),
        insets: EdgeInsets.symmetric(horizontal: 5.0)),
  );
}

ProgressIndicatorThemeData _loaderTheme() =>
    const ProgressIndicatorThemeData(color: AppColors.black);

DividerThemeData _dividerTheme() => const DividerThemeData(
      color: AppColors.black,
    );

IconThemeData _iconThem() {
  return const IconThemeData(
    color: AppColors.black,
  );
}

BottomNavigationBarThemeData _bottomBarTheme() =>
    const BottomNavigationBarThemeData();

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    backgroundColor: AppColors.white,
    titleTextStyle: poppins.get20.w500.black,
    centerTitle: false,
    actionsIconTheme: const IconThemeData(color: AppColors.black, size: 20),
    iconTheme: const IconThemeData(color: AppColors.black),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
