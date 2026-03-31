import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skill {
  final IconData icon;
  final String title;

  Skill({required this.icon, required this.title});
}

class HomeController extends GetxController {
  // List of skills
  final skills = <Skill>[
    Skill(icon: Icons.phone_android, title: "App Developer"),
    Skill(icon: Icons.code, title: "Web Developer"),
  ].obs;

  // Action when Resume button is pressed
  void openResume() {
    // TODO: Add logic to open resume PDF or link
    print("Resume button clicked");
  }

  // Action when Contact button is pressed
  void openContact() {
    // TODO: Navigate to Contact screen
    print("Contact button clicked");
  }
}
