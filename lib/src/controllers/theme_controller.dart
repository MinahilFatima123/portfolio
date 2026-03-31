import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/utils/ThemeCollection.dart';

class ThemeController extends GetxController {
  // RxBool to track dark mode
  RxBool isDarkMode = false.obs;

  // Toggle theme
  void toggleTheme() {
    if (isDarkMode.value) {
      Get.changeTheme(ThemeCollection.lightTheme);
      isDarkMode.value = false;
    } else {
      Get.changeTheme(ThemeCollection.darkTheme);
      isDarkMode.value = true;
    }
  }
}
