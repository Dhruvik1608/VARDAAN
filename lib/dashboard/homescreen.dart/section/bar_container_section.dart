import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/doctor_logout_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/log_out_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bar_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/name_expandable_container.dart';

class BarContainerSection extends StatelessWidget {
  const BarContainerSection({super.key});

  @override
  Widget build(BuildContext context) {
    print("Bar container section builded");
    final HomescreenController homescreenController = Get.find();
    final userData = GetStorage();
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 63.h, 18.h, 0),
      child: Row(
        children: [
          Obx(() {
            print("barcontainer builded");
            return BarContainer(
              color1: homescreenController.expandableBarColor(),
              color2: homescreenController.expandableBarColor2(),
              width1: 66.w,
              width2: 57.w,
              image: "assets/logos/vardaanLogo.png",
            );
          }),
          const Spacer(),
          GestureDetector(
            onTap: () {
              homescreenController.isPatient.value
                  ? userData.read('isLogged') == true
                      ? Get.to(
                        () => const LogOutScreen(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 300),
                        curve: Easing.emphasizedAccelerate,
                      )
                      : null
                  : Get.to(() => const DoctorLogoutScreen());
            },
            child: const NameExpandableContainer(),
          ),
        ],
      ),
    );
  }
}
