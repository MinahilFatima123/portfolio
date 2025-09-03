import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/utils/extensions/theme_extensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final isMobile = screenWidth < 700;

    return Scaffold(
      backgroundColor: context.screenBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(isMobile ? 12 : 24),
            child: Container(
              padding: const EdgeInsets.all(24),
              constraints: const BoxConstraints(maxWidth: 900),
              decoration: BoxDecoration(
                color: context.sidebarColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Heading
                  Text(
                    "About my Journey!",
                    style: context.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Two Columns (responsive)
                  isMobile
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _leftColumn(context),
                      const SizedBox(height: 32),
                      _rightColumn(context),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _leftColumn(context)),
                      const SizedBox(width: 32),
                      Expanded(flex: 1, child: _rightColumn(context)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Left Column: Me, Technical Skills, Featured Skills
  Widget _leftColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Me", style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(
          "I am a passionate Computer Engineering student with experience in mobile and web development. "
              "I love building apps and solving problems with efficient code.",
          style: context.bodyMedium,
        ),
        const SizedBox(height: 24),
        Text("Technical Skills", style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _skillChip(context, "Flutter"),
            _skillChip(context, "Dart"),
            _skillChip(context, "OOP"),
            _skillChip(context, "DSA"),
            _skillChip(context, "SQL"),
          ],
        ),
        const SizedBox(height: 24),
        Text("Featured Skills", style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _skillProgress(context, "Mobile App Developer", 0.85),
        const SizedBox(height: 8),
        _skillProgress(context, "Web Developer", 0.75),
      ],
    );
  }

  // Right Column: Education
  Widget _rightColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Education", style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _educationItem(context, "2022-2026", "Computer Engineering", "COMSATS University Islamabad", "CGPA: 3.38"),
        const SizedBox(height: 12),
        _educationItem(context, "2020-2022", "Intermediate (ICS)", "KIPS College Lahore"),
        const SizedBox(height: 12),
        _educationItem(context, "2018-2020", "SSC", "Peide Public High School Lahore"),
      ],
    );
  }

  // Skill Chip
  Widget _skillChip(BuildContext context, String skill) {
    return Chip(
      label: Text(skill, style: context.bodySmall),
      backgroundColor: context.primaryColor.withOpacity(0.1),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  // Skill Progress
  Widget _skillProgress(BuildContext context, String skill, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(skill, style: context.bodyMedium),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: context.primaryColor.withOpacity(0.2),
            color: context.primaryColor,
          ),
        ),
      ],
    );
  }

  // Education Item
  Widget _educationItem(BuildContext context, String year, String degree, String institution, [String? additional]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(year, style: context.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
        Text(degree, style: context.bodyMedium),
        Text(institution, style: context.bodyMedium),
        if (additional != null) Text(additional, style: context.bodyMedium),
      ],
    );
  }
}
