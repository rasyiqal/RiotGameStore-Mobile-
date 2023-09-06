import 'package:get/get.dart';
import 'package:mobile_ver/Pages/FuturedScreen.dart';
import 'package:mobile_ver/Pages/HomeScreen.dart';
import 'package:mobile_ver/Pages/collectibleScreen.dart';
import 'package:mobile_ver/Pages/profileScreen.dart';
import 'package:mobile_ver/Pages/ChartScreen.dart';
import 'package:mobile_ver/navigation/navigation.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const Navigation()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: chartscreen, page: () => const ChartScreen()),
    GetPage(name: futuredscreen, page: () => const FuturedScreen()),
    GetPage(name: collectiblescreen, page: () => const CollectibleScreen()),
    GetPage(name: profile, page: () => const profileScreen()),
  ];

  static getNavbar() => navbar;
  static getHome() => home;
  static getChartscreen() => chartscreen;
  static getFuturedscreen() => futuredscreen;
  static getCollectibleScreen() => collectiblescreen;
  static getProfile() => profile;

  //
  static String navbar = '/';
  static String home = '/home';
  static String chartscreen = '/chartscreen';
  static String futuredscreen = '/futuredscreen';
  static String collectiblescreen = '/collectiblescreen';
  static String profile = '/profilescreen';

}