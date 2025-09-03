import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/utils/extensions/theme_extensions.dart';
import 'logic.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

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
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: context.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top row: Name + Buttons
                    isMobile
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Minahil Fatima",
                          style: context.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.textBlack,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _resumeButton(context),
                            const SizedBox(width: 12),
                            _contactButton(context),
                          ],
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Minahil Fatima",
                          style: context.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.textBlack,
                          ),
                        ),
                        Row(
                          children: [
                            _resumeButton(context),
                            const SizedBox(width: 12),
                            _contactButton(context),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Skills + About Me
                    isMobile
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...controller.skills
                            .map((skill) => _skillCard(context, skill))
                            .toList(),
                        const SizedBox(height: 24),
                        _aboutMeSection(context),
                      ],
                    )
                        : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left: Skill Cards
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                            children: controller.skills
                                .map((skill) =>
                                _skillCard(context, skill))
                                .toList(),
                          ),
                        ),
                        const SizedBox(width: 24),
                        // Right: About Me
                        Expanded(
                          flex: 2,
                          child: _aboutMeSection(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Skill Card
  Widget _skillCard(BuildContext context, Skill skill) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.primaryColor,
            child: Icon(skill.icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              skill.title,
              style: context.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.textBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // About Me Section
  Widget _aboutMeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.textBlack,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Hi! I am Minahil Fatima, a university student starting my journey in Flutter app development. "
              "I enjoy learning and building small mobile projects to improve my skills.",
          style: context.bodyMedium?.copyWith(color: context.textGray),
        ),
        const SizedBox(height: 16),
        // GitHub container
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: context.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.code, size: 24, color: context.primaryColor),
              const SizedBox(width: 8),
              Text(
                "GitHub",
                style: context.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Resume Button
  Widget _resumeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: controller.openResume,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        "Resume",
        style: TextStyle(color: context.textWhite),
      ),
    );
  }

  // Contact Button
  Widget _contactButton(BuildContext context) {
    return OutlinedButton(
      onPressed: controller.openContact,
      style: OutlinedButton.styleFrom(
        foregroundColor: context.primaryColor,
        side: BorderSide(color: context.primaryColor),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Contact"),
    );
  }
}
