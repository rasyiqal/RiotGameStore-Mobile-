import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_ver/Pages/HomeScreen.dart';
import 'package:mobile_ver/Pages/FuturedScreen.dart';
import 'package:mobile_ver/Pages/collectibleScreen.dart';
import 'package:mobile_ver/Pages/profileScreen.dart';
import 'package:mobile_ver/Pages/ChartScreen.dart';
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
              FuturedScreen(),
              ChartScreen(),
              CollectibleScreen(),
              profileScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.tabIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromRGBO(255, 255, 255, 1), //0xFF8A0707
            showUnselectedLabels: false,
            onTap: controller.changeTabIndex,
            items: [
              _bottombarItem(IconlyBold.home, 'Home'),
              _bottombarItem(IconlyBold.star, 'Futured'),
              _bottombarItem(IconlyBold.buy, 'Chart'),
              _bottombarItem(IconlyBold.category, 'Collectible'),
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
