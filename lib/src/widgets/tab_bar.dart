import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_project_container.dart';
import '/src/utils/extensions/theme_extensions.dart';

// Controller for Projects Tab
class ProjectsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final tabs = ['All Apps', 'WebApps', 'Others'];

  RxBool showSidebar = false.obs;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class ProjectsTabBarWidget extends StatelessWidget {
  const ProjectsTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectsController());
    final screenWidth = Get.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      // Floating menu button for mobile
      floatingActionButton: isMobile
          ? Obx(
            () => FloatingActionButton(
          backgroundColor: context.primaryColor,
          child: Icon(controller.showSidebar.value ? Icons.close : Icons.menu),
          onPressed: () => controller.showSidebar.toggle(),
        ),
      )
          : null,
      body: Row(
        children: [
          // Sidebar
          Obx(() => (!isMobile || controller.showSidebar.value)
              ? Container(
            width: isMobile ? 200 : 250,
            color: const Color(0xFF1C1C1E),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: context.textBlack,
                        child: Icon(Icons.person, color: context.textWhite),
                      ),
                      if (!isMobile) const SizedBox(width: 12),
                      if (!isMobile)
                        Text(
                          "Minahil Fatima",
                          style: context.titleMedium?.copyWith(color: context.textWhite),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _navItem(context, Icons.home, "Home", 0),
                      _navItem(context, Icons.person, "Profile", 1),
                      _navItem(context, Icons.work, "Projects", 2),
                      _navItem(context, Icons.history, "Experience", 3),
                      _navItem(context, Icons.mail, "Contact", 4),
                    ],
                  ),
                ),
              ],
            ),
          )
              : const SizedBox.shrink()),

          // Main content
          Expanded(
            child: Column(
              children: [
                // Custom spaced TabBar
                Obx(() => Row(
                  children: List.generate(controller.tabs.length, (index) {
                    final isSelected = controller.currentIndex.value == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => controller.tabController.animateTo(index),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isSelected
                                    ? context.primaryColor
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            controller.tabs[index],
                            style: TextStyle(
                              color: isSelected
                                  ? context.primaryColor
                                  : context.textGray,
                              fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )),
                const SizedBox(height: 16),

                // Tab views with arrows
                Flexible(
                  child: Stack(
                    children: [
                      TabBarView(
                        controller: controller.tabController,
                        children: controller.tabs.map((tab) {
                          int crossAxisCount;
                          if (screenWidth < 600) {
                            crossAxisCount = 1;
                          } else if (screenWidth < 900) {
                            crossAxisCount = 2;
                          } else {
                            crossAxisCount = 3;
                          }

                          final projects = [
                            {
                              "title": "Project A",
                              "description": "This is a sample mobile app project.",
                              "techStack": ["Flutter", "Dart", "Firebase"],
                            },
                            {
                              "title": "Project B",
                              "description": "Web application built for e-commerce.",
                              "techStack": ["React", "NodeJS", "MongoDB"],
                            },
                            {
                              "title": "Project C",
                              "description": "A small utility tool.",
                              "techStack": ["Python", "Tkinter"],
                            },
                          ];

                          return GridView.builder(
                            padding: const EdgeInsets.all(12),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              final p = projects[index];
                              return ProjectContainerWidget(
                                title: p['title'] as String,
                                description: p['description'] as String,
                                techStack: p['techStack'] as List<String>,
                                onGithubTap: () {},
                                onAttachmentTap: () {},
                              );
                            },
                          );
                        }).toList(),
                      ),

                      // Left Arrow
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Obx(() => Visibility(
                          visible: controller.currentIndex.value > 0,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                color: context.primaryColor),
                            onPressed: () {
                              if (controller.currentIndex.value > 0) {
                                controller.tabController.animateTo(
                                    controller.currentIndex.value - 1);
                              }
                            },
                          ),
                        )),
                      ),

                      // Right Arrow
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Obx(() => Visibility(
                          visible: controller.currentIndex.value <
                              controller.tabs.length - 1,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                color: context.primaryColor),
                            onPressed: () {
                              if (controller.currentIndex.value <
                                  controller.tabs.length - 1) {
                                controller.tabController.animateTo(
                                    controller.currentIndex.value + 1);
                              }
                            },
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sidebar navigation item
  Widget _navItem(BuildContext context, IconData icon, String label, int index) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Icon(icon, color: context.primaryColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: context.bodyMedium?.copyWith(color: context.textWhite),
            ),
          ],
        ),
      ),
    );
  }
}
