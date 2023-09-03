import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_ver/Pages/HomeScreen.dart';
import 'package:mobile_ver/Pages/artScreen.dart';
import 'package:mobile_ver/Pages/profileScreen.dart';
import 'package:mobile_ver/Pages/UpcomingScreen.dart';
import 'package:mobile_ver/controller/controller.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final controller = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeScreen(),
              artScreen(),
              UpcomingScreen(),
              profileScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF8A0707),
            currentIndex: controller.tabIndex,
            selectedItemColor: Color(0xFF8A0707),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: controller.changeTabIndex,
            items: [
              _bottombarItem(IconlyBold.home, 'Home'),
              _bottombarItem(IconlyBold.chart, 'Art'),
              _bottombarItem(IconlyBold.chart, 'Upcoming'),
              _bottombarItem(IconlyBold.profile, 'Profile'),
            ],
          ),
        ),
      );
    });
  }
}

_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
