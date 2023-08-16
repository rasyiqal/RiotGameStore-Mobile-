import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ver/route/route.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getNavbar(),
    getPages: AppPage.routes,
  ));
}