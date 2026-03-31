import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/utils/extensions/theme_extensions.dart';
import 'data.dart';

class ExperienceScreen extends StatelessWidget {
  ExperienceScreen({super.key});

  final ExperienceController controller = Get.put(ExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.screenBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(controller.isMobile ? 12 : 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    "My Experience",
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: context.textGray.withOpacity(0.3),
                    thickness: 1,
                  ),
                  const SizedBox(height: 16),

                  // Experience List
                  Obx(() => Column(
                    children: controller.experiences
                        .map((exp) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _experienceCard(context, exp),
                    ))
                        .toList(),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Experience Card Widget
  Widget _experienceCard(BuildContext context, Experience exp) {
    final isMobile = controller.isMobile;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.sidebarColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Job title
          Text(
            exp.title,
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.textBlack,
            ),
          ),
          const SizedBox(height: 4),

          // Company
          Text(
            exp.company,
            style: context.bodyMedium?.copyWith(
              color: context.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),

          // Duration
          Text(
            exp.duration,
            style: context.bodyMedium?.copyWith(
              color: context.textGray,
            ),
          ),
          const SizedBox(height: 12),

          // Description
          Text(
            exp.description,
            style: context.bodyMedium?.copyWith(
              color: context.textGray,
            ),
            maxLines: isMobile ? 6 : 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
