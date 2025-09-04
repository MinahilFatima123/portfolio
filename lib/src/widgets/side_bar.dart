import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/utils/extensions/theme_extensions.dart';
import '/src/controllers/theme_controller.dart';
// Import your actual screens
import '/src/modules/home_screen/view.dart';
import '/src/modules/project/view.dart';
import '/src/modules/profile/view.dart';
import '/src/modules/experience/view.dart';
import '/src/modules/contact/view.dart';
import '/src/utils/AppColor.dart';

/// Controller to manage sidebar state
class SideBarController extends GetxController {
  var selectedIndex = 0.obs;
  var isExpanded = true.obs;
  final ThemeController themeController = Get.find();
}

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final SideBarController c = Get.put(SideBarController());

  final List<Widget> screens = [
    HomeScreen(),
    ProfileScreen(),
    ProjectsScreen(),
    ExperienceScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      )
          : null,
      drawer: isMobile ? _buildDrawer(context) : null,
      body: Row(
        children: [
          // Sidebar for desktop
          if (!isMobile) _buildSidebar(context),

          // Main screen
          Expanded(
            child: Container(
              color: context.screenBackground,
              child: Obx(
                    () => IndexedStack(
                  index: c.selectedIndex.value,
                  children: screens,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Sidebar for desktop/web
  Widget _buildSidebar(BuildContext context) {
    return Obx(
          () => Container(
        width: c.isExpanded.value ? 200 : 72,
        color: const Color(0xFF1C1C1E),
        child: Column(
          children: [
            // Top avatar + name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColor.darkScreenBackground,
                    child: Icon(Icons.person, color: context.textWhite),
                  ),
                  if (c.isExpanded.value) ...[
                    const SizedBox(width: 10),
                    Text(
                      "Minahil Fatima",
                      style: context.titleMedium
                          ?.copyWith(color: context.textWhite),
                    ),
                  ]
                ],
              ),
            ),

            // Navigation items
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

            const Divider(color: Colors.white24, thickness: 1),

            // Bottom column: stacked buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Theme toggle button
                  Obx(() => IconButton(
                    icon: Icon(
                      c.themeController.isDarkMode.value
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: context.textWhite,
                    ),
                    onPressed: () => c.themeController.toggleTheme(),
                  )),

                  // Sidebar expand/collapse button
                  IconButton(
                    icon: Icon(
                      c.isExpanded.value ? Icons.arrow_back : Icons.arrow_forward,
                      color: context.textWhite,
                    ),
                    onPressed: () => c.isExpanded.value = !c.isExpanded.value,
                  ),
                ],
              ),
            ),


            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// Navigation item for sidebar
  Widget _navItem(BuildContext context, IconData icon, String label, int index) {
    return Obx(() {
      final selected = c.selectedIndex.value == index;

      return InkWell(
        onTap: () => c.selectedIndex.value = index,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: Icon(
                  icon,
                  color: selected ? context.primaryColor : context.textWhite,
                ),
              ),
              if (c.isExpanded.value)
                Expanded(
                  child: Text(
                    label,
                    style: context.bodyMedium?.copyWith(
                      color:
                      selected ? context.primaryColor : context.textWhite,
                      fontWeight:
                      selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  /// Drawer for mobile
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1C1C1E),
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColor.darkScreenBackground,
                  child: Icon(Icons.person, color: context.textWhite),
                ),
                const SizedBox(width: 10),
                Text(
                  "Minahil Fatima",
                  style: context.titleMedium?.copyWith(color: context.textWhite),
                ),
              ],
            ),
          ),
          _drawerNavItem(context, Icons.home, "Home", 0),
          _drawerNavItem(context, Icons.person, "Profile", 1),
          _drawerNavItem(context, Icons.work, "Projects", 2),
          _drawerNavItem(context, Icons.history, "Experience", 3),
          _drawerNavItem(context, Icons.mail, "Contact", 4),

          const Spacer(),

          // Theme toggle button at bottom of drawer
          Obx(() => ListTile(
            leading: Icon(
              Get.find<ThemeController>().isDarkMode.value
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: context.textWhite,
            ),
            title: Text(
              "Toggle Theme",
              style: context.bodyMedium?.copyWith(color: context.textWhite),
            ),
            onTap: () => Get.find<ThemeController>().toggleTheme(),
          )),
        ],
      ),
    );
  }


  /// Drawer navigation item for mobile
  Widget _drawerNavItem(
      BuildContext context, IconData icon, String label, int index) {
    return Obx(() {
      final selected = c.selectedIndex.value == index;
      return ListTile(
        leading: Icon(
          icon,
          color: selected ? context.primaryColor : context.textWhite,
        ),
        title: Text(
          label,
          style: context.bodyMedium?.copyWith(
            color: selected ? context.primaryColor : context.textWhite,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        onTap: () {
          c.selectedIndex.value = index;
          Navigator.of(context).pop(); // close drawer
        },
      );
    });
  }
}
