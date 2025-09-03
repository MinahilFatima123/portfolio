import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AppFonts.dart';
import 'AppColor.dart';

class ThemeCollection {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.screenBackground,

    // Define a ColorScheme so you can access colors from context
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryColor,
      surface: AppColor.sidebarColor,
      //background: AppColor.screenBackground,
      onSurface: AppColor.textGray,
     // onBackground: AppColor.textBlack,
      onPrimary: AppColor.textWhite,
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: AppFonts.largeBold.copyWith(color: AppColor.textWhite),
      titleMedium: AppFonts.mediumSemiBold.copyWith(color: AppColor.textWhite),
      titleSmall: AppFonts.smallSemiBold.copyWith(color: AppColor.textWhite),
      bodyLarge: AppFonts.large.copyWith(color: AppColor.textWhite),
      bodyMedium: AppFonts.medium.copyWith(
        color: AppColor.textGray,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: AppFonts.small.copyWith(
        color: AppColor.textGray,
      ),
      labelLarge: AppFonts.mediumSemiBold.copyWith(color: AppColor.textWhite),
      labelMedium: AppFonts.smallSemiBold.copyWith(color: AppColor.textWhite),
      labelSmall: AppFonts.small.copyWith(color: AppColor.textWhite),
    ),
  );
}
