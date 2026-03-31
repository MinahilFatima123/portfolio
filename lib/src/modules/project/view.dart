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
        "title": "Decentralized Supply Chain Monitoring System",
        "description":
        "Final Year Project: Building a Flutter app for real-time product tracking using IoT sensors, Ethereum blockchain (Sepolia), and IPFS for secure and transparent data storage.",
        "techStack": ["Flutter", "Dart", "Blockchain", "IoT", "Firebase", "IPFS"],
        "category": "Apps",
      },
      {
        "title": "Travenor – Travel App",
        "description":
        "Developed a travel app with phone OTP authentication and real-time Firestore database, featuring responsive UI across Android and iOS.",
        "techStack": ["Flutter", "Dart", "Firebase Auth", "Firestore", "OTP"],
        "category": "Apps",
      },
      {
        "title": "Leads Management App",
        "description":
        "Built a leads tracking app using GetX for state management and integrated FCM push notifications for real-time updates.",
        "techStack": ["Flutter", "Dart", "GetX", "Firebase Cloud Messaging"],
        "category": "Apps",
      },
      {
        "title": "Portfolio App & Website",
        "description":
        "Designed and deployed a personal portfolio as a mobile app and responsive web app using Flutter Web and Vercel.",
        "techStack": ["Flutter", "Dart", "Flutter Web", "Vercel"],
        "category": "Web Apps",
      },
      {
        "title": "Weatherly – Weather App",
        "description":
        "Developed a real-time weather forecasting app using REST APIs with Dio and a clean, responsive UI.",
        "techStack": ["Flutter", "Dart", "Dio", "REST API"],
        "category": "Apps",
      },
      {
        "title": "Grocery App",
        "description":
        "Built a grocery shopping app with product listings, cart, and checkout, using Firebase for authentication and data storage.",
        "techStack": ["React Native", "JavaScript", "Firebase Auth", "Firestore", "Firebase Storage"],
        "category": "Apps",
      }
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
