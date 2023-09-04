import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ver/route/route.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF8A0707),
        ),
      ),
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getNavbar(),
    getPages: AppPage.routes,
  ));
}
