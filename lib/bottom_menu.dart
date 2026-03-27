import 'package:clip_react/screens/clips/clips.dart';
import 'package:clip_react/screens/home/home.dart';
import 'package:clip_react/screens/profile/profile.dart';
import 'package:clip_react/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 60,
            elevation: 0,
            indicatorColor: Colors.transparent,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.movie), label: 'Clips'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [HomeScreen(), ClipsScreen(), ProfileScreen()];
}
