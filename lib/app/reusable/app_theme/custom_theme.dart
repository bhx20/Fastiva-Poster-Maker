import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/colors.dart';
import '../../core/typography.dart';

//==============================================================================
// ** Custom Theme  **
//==============================================================================

final ThemeData customTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: _appBarTheme(),
  bottomNavigationBarTheme: _bottomBarTheme(),
  iconTheme: _iconThem(),
  dividerTheme: _dividerTheme(),
  progressIndicatorTheme: _loaderTheme(),
  tabBarTheme: _tabTheme(),
  elevatedButtonTheme: _elevatedButtonTheme(),
  outlinedButtonTheme: _outlineButtonTheme(),
  textButtonTheme: _textButtonTheme(),
  primaryIconTheme: _iconThem(),
);

//==============================================================================
// ** Helper Function  **
//==============================================================================

TextButtonThemeData _textButtonTheme() =>
    const TextButtonThemeData(style: ButtonStyle());

OutlinedButtonThemeData _outlineButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );
}

ElevatedButtonThemeData _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
          color: AppColors.black,
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
    centerTitle: true,
    titleTextStyle: poppins.w500.black.get14,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.black),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
