import 'package:get/get.dart';
import 'package:mobile_ver/Pages/artScreen.dart';
import 'package:mobile_ver/Pages/collectibleScreen.dart';
import 'package:mobile_ver/Pages/homeScreen.dart';
import 'package:mobile_ver/Pages/profileScreen.dart';
import 'package:mobile_ver/Pages/saleScreen.dart';
import 'package:mobile_ver/navigation/navigation.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const Navigation()),
    GetPage(name: home, page: () => const homeScreen()),
    GetPage(name: salescreen, page: () => const saleSacreen()),
    GetPage(name: artscreen, page: () => const artScreen()),
    GetPage(name: profile, page: () => const profileScreen()),
    GetPage(name: collectibleScreen, page: () => const collectible()),
  ];

  static getNavbar() => navbar;
  static getHome() => home;
  static getSalescreen() => salescreen;
  static getArtscreen() => artscreen;
  static getProfile() => profile;
  static getCollectible() => collectibleScreen;

  //
  static String navbar = '/';
  static String home = '/home';
  static String salescreen = '/salescreen';
  static String artscreen = '/artscreen';
  static String profile = '/profilescreen';
  static String collectibleScreen = '/collectible';

}