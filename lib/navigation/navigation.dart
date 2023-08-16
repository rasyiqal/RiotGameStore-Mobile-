import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_ver/Pages/artScreen.dart';
import 'package:mobile_ver/Pages/collectibleScreen.dart';
import 'package:mobile_ver/Pages/homeScreen.dart';
import 'package:mobile_ver/Pages/profileScreen.dart';
import 'package:mobile_ver/Pages/saleScreen.dart';
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
              homeScreen(),
              artScreen(),
              collectible(),
              saleSacreen(),
              profileScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: controller.tabIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: controller.changeTabIndex,
            items: [
              _bottombarItem(IconlyBold.home, 'home'),
              _bottombarItem(IconlyBold.plus, 'home'),
              _bottombarItem(IconlyBold.time_square, 'home'),
              _bottombarItem(IconlyBold.chart, 'home'),
              _bottombarItem(IconlyBold.profile, 'profile'),
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
