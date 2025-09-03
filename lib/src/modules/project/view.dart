import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/widgets/custom_project_container.dart';
import '/src/utils/extensions/theme_extensions.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Apps', 'Web Apps', 'Others'];

    final projects = [
      {
        "title": "Hostel Management",
        "description":
        "Created a hostel management web app to track students and download daily attendance.",
        "techStack": ["Redux", "Node Js", "Express Js", "Mongo DB", "React Js"],
        "category": "Web Apps",
      },
      {
        "title": "E Commerce",
        "description":
        "An e-commerce application similar to Amazon or Flipkart, includes admin panel.",
        "techStack": ["Redux", "Node Js", "Express Js", "Mongo DB", "React Js"],
        "category": "Web Apps",
      },
      {
        "title": "Flutter Custom Graph",
        "description":
        "Created a flutter package for building customized and aesthetic graphs.",
        "techStack": ["Flutter"],
        "category": "Apps",
      },
      {
        "title": "Face Mask Detection",
        "description":
        "Mobile application to detect whether person is wearing a mask or not.",
        "techStack": ["Flutter", "TensorFlow"],
        "category": "Apps",
      },
      {
        "title": "Other Project Example",
        "description": "A smaller project that falls under 'Others' tab.",
        "techStack": ["Dart"],
        "category": "Others",
      },
    ];

    final screenWidth = Get.width;

    int getCrossAxisCount() {
      if (screenWidth < 600) return 1; // Mobile
      if (screenWidth < 900) return 2; // Tablet
      return 3; // Desktop
    }

    return Scaffold(
      backgroundColor: context.screenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Some Things I've Built",
                style: context.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: DefaultTabController(
                  length: tabs.length,
                  child: Column(
                    children: [
                      // Tab Bar
                      TabBar(
                        indicatorColor: context.primaryColor,
                        labelColor: context.primaryColor,
                        unselectedLabelColor: context.textGray,
                        isScrollable: true,
                        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                      ),
                      const SizedBox(height: 12),
                      // Tab Views
                      Expanded(
                        child: TabBarView(
                          children: tabs.map((tab) {
                            final filteredProjects = tab == 'All'
                                ? projects
                                : projects
                                .where((p) => p['category'] == tab)
                                .toList();

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: getCrossAxisCount(),
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: screenWidth < 600
                                    ? 1.2
                                    : screenWidth < 900
                                    ? 1.1
                                    : 0.75,
                              ),
                              itemCount: filteredProjects.length,
                              itemBuilder: (context, index) {
                                final p = filteredProjects[index];
                                return ProjectContainerWidget(
                                  title: p['title'] as String,
                                  description: p['description'] as String,
                                  techStack:
                                  List<String>.from(p['techStack'] as List),
                                  onAttachmentTap: () {},
                                  onGithubTap: () {},
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
