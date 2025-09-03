import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/src/widgets/side_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set transparent status bar with dark icons
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent background
    statusBarIconBrightness: Brightness.dark, // dark icons for Android
    statusBarBrightness: Brightness.light, // dark icons for iOS
    systemNavigationBarColor: Colors.white, // bottom nav bar white
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // keep background white
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark, // makes sure dark icons
        ),
      ),
      home: SideBar(),
    );
  }
}
