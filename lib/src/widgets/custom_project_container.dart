import 'package:flutter/material.dart';
import '/src/utils/extensions/theme_extensions.dart';
import 'package:get/get.dart';

class ProjectContainerWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final VoidCallback? onGithubTap;
  final VoidCallback? onAttachmentTap;

  const ProjectContainerWidget({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    this.onGithubTap,
    this.onAttachmentTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final containerWidth = screenWidth < 600
        ? double.infinity
        : (screenWidth / 3) - 32;

    return Container(
      width: containerWidth,
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
          // Top row: folder icon + links
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.folder, color: context.primaryColor, size: 28),
              Row(
                children: [
                  if (onAttachmentTap != null)
                    IconButton(
                      icon: const Icon(Icons.link),
                      color: context.textBlack,
                      onPressed: onAttachmentTap,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  if (onGithubTap != null)
                    IconButton(
                      icon: const Icon(Icons.code),
                      color: context.textBlack,
                      onPressed: onGithubTap,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          // Project title
          Text(
            title,
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.textBlack,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Description
          Text(
            description,
            style: context.bodyMedium?.copyWith(color: context.textGray),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: techStack
                .map((tech) => Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: context.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                tech,
                style: context.bodySmall?.copyWith(
                  color: context.primaryColor,
                ),
              ),
            ))
                .toList(),
          )
        ],
      ),
    );
  }
}
