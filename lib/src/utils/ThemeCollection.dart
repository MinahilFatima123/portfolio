import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AppFonts.dart';
import 'AppColor.dart';

class ThemeCollection {
  // ---------------- Light Theme ----------------
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.screenBackground,

    colorScheme: ColorScheme.light(
      primary: AppColor.primaryColor,
      surface: AppColor.sidebarColor,
      onSurface: AppColor.textGray,
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
      titleLarge: AppFonts.largeBold.copyWith(color: AppColor.textBlack),
      titleMedium: AppFonts.mediumSemiBold.copyWith(color: AppColor.textBlack),
      titleSmall: AppFonts.smallSemiBold.copyWith(color: AppColor.textBlack),
      bodyLarge: AppFonts.large.copyWith(color: AppColor.textBlack),
      bodyMedium: AppFonts.medium.copyWith(
        color: AppColor.textGray,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: AppFonts.small.copyWith(color: AppColor.textGray),
      labelLarge: AppFonts.mediumSemiBold.copyWith(color: AppColor.textBlack),
      labelMedium: AppFonts.smallSemiBold.copyWith(color: AppColor.textBlack),
      labelSmall: AppFonts.small.copyWith(color: AppColor.textGray),
    ),
  );

  // ---------------- Dark Theme ----------------
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.darkPrimaryColor,
    scaffoldBackgroundColor: AppColor.darkScreenBackground,

    colorScheme: ColorScheme.dark(
      primary: AppColor.darkPrimaryColor,
      surface: AppColor.darkSidebarColor,
      onSurface: AppColor.darkTextGray,
      onPrimary: AppColor.darkTextWhite,
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.darkSidebarColor,
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: AppFonts.largeBold.copyWith(color: AppColor.darkTextWhite),
      titleMedium: AppFonts.mediumSemiBold.copyWith(color: AppColor.darkTextWhite),
      titleSmall: AppFonts.smallSemiBold.copyWith(color: AppColor.darkTextWhite),
      bodyLarge: AppFonts.large.copyWith(color: AppColor.darkTextWhite),
      bodyMedium: AppFonts.medium.copyWith(
        color: AppColor.darkTextGray,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: AppFonts.small.copyWith(color: AppColor.darkTextGray),
      labelLarge: AppFonts.mediumSemiBold.copyWith(color: AppColor.darkTextWhite),
      labelMedium: AppFonts.smallSemiBold.copyWith(color: AppColor.darkTextWhite),
      labelSmall: AppFonts.small.copyWith(color: AppColor.darkTextGray),
    ),
  );
}
