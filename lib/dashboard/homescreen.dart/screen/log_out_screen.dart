import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/patient_login_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/logout_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/profile_change_design.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/smaller_appbar.dart';
import 'package:vardaan/utils/colors.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController homescreenController = Get.find();

    final userData = GetStorage();

    return Scaffold(
      backgroundColor: visualsColor.withoutBarBackground,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 171.h),
                ProfileChangeDesign(),
                const SizedBox(height: 16),
                LogoutContainer(
                  title: "Patient ID",
                  image: "assets/designs/violet/viloetid.png",
                  content: userData.read("Id").toString(),
                ),
                const SizedBox(height: 12),
                LogoutContainer(
                  title: "Name",
                  image: "assets/designs/violet/viloetname.png",
                  content: userData.read("Name"),
                ),
                const SizedBox(height: 12),
                LogoutContainer(
                  title: "Gender",
                  image: "assets/designs/violet/viloetgender.png",
                  content: userData.read("Gender"),
                ),
                const SizedBox(height: 12),
                LogoutContainer(
                  title: "Contact no.",
                  image: "assets/designs/violet/viloetcall.png",
                  content: userData.read("MNo").toString(),
                ),
                const SizedBox(height: 12),
                LogoutContainer(
                  title: "Email ID",
                  image: "assets/designs/violet/viloetemail.png",
                  content: userData.read("Email"),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      homescreenController.isPatient.value = false;
                      homescreenController.barIndex.value = 1;

                      Get.offAll(
                        () => PatientLoginScreen(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 300),
                        curve: Easing.emphasizedAccelerate,
                      );
                      userData.write("isLogged", false);
                      userData.remove("Id");
                      userData.remove("Name");
                      userData.remove("Email");
                      userData.remove("Age");
                      userData.remove("Gender");
                      userData.remove("FName");
                      userData.remove("MName");
                      userData.remove("MNo");
                      userData.remove("Consulting");
                      userData.remove("Health");
                    },
                    child: Container(
                      width: 200.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: visualsColor.redLogout,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: const Center(
                        child: Text(
                          "Log out",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: visualsColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SmallerAppbar(
            color1: visualsColor.violet,
            color2: visualsColor.violetlight,
          ),
        ],
      ),
    );
  }
}
