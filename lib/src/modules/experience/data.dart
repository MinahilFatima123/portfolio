import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Experience {
  final String title;
  final String company;
  final String duration;
  final String description;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });
}

class ExperienceController extends GetxController {
  // List of experiences (can be fetched from API in the future)
  final experiences = <Experience>[
    Experience(
      title: "Flutter App Intern",
      company: "Codecoy Technologies",
      duration: "July 2025 - Present",
      description: "Currently working as an intern, gaining hands-on experience in Flutter development.",
    ),
    // Add more experiences here easily
    // Experience(
    //   title: "Mobile App Intern",
    //   company: "XYZ Solutions",
    //   duration: "Jan 2025 - June 2025",
    //   description: "Developed small Flutter apps and learned state management.",
    // ),
  ].obs; // Make the list reactive

  bool get isMobile => Get.width < 700;
}
