import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/add_patient_screen.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/find_patient_screen.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/update_patient_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/appbar_expanded.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bottom_nav_bar.dart';

class HomeScreenDoctor extends StatelessWidget {
  const HomeScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController homescreenController =
        Get.find<HomescreenController>();
    const List tabs = [
      const FindPatientScreen(),
      const AddPatientScreen(),
      const UpdatePatientScreen(),
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
