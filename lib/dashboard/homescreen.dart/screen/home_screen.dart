import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/ask_login_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/map_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/patient_info_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/scheme_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/appbar_expanded.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = GetStorage();
    final HomescreenController homescreenController =
        Get.find<HomescreenController>();
    List tabs = [
      const SchemeScreen(),
      const MapScreen(),
      userData.read('isLogged') == true
          ? PatientInfoScreen()
          : const AskLoginScreen(),
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(() => tabs[homescreenController.barIndex.value]),
          const AppbarExpanded(),
          const BottomNavBar(),
        ],
      ),
    );
  }
}
