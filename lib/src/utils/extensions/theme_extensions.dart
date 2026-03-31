import 'package:flutter/material.dart';

extension ThemeExtras on BuildContext {
  // 🎨 Colors from ThemeData / ColorScheme
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get screenBackground => Theme.of(this).scaffoldBackgroundColor;
  Color get sidebarColor => Theme.of(this).colorScheme.surface;
  Color get textGray => Theme.of(this).colorScheme.onSurface;
  Color get textBlack => Theme.of(this).colorScheme.onBackground;
  Color get textWhite => Theme.of(this).colorScheme.onPrimary;

  // 📝 Text styles from ThemeData / TextTheme
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}
