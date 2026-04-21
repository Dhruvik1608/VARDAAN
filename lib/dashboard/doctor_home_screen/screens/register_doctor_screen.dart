import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/doctor_register_controller.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/patient_login_screen.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/auth_button.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bar_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/designed_text_field.dart';
import 'package:vardaan/utils/colors.dart';

class RegisterDoctorScreen extends StatelessWidget {
  const RegisterDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorCreateController controller =
        Get.find<DoctorCreateController>();
    double screenHeight = ScreenUtil().screenHeight;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/registerbgBlur.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110.h),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: BarContainer(
                    width1: 52.w,
                    height1: 52.h,
                    width2: 43.w,
                    height2: 43.h,
                    color1: visualsColor.peach,
                    color2: visualsColor.peachlight,
                    image: "assets/logos/crossVector.png",
                  ),
                ),
                const SizedBox(height: 39),
                const Center(
                  child: Text(
                    "VARDAAN",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      color: visualsColor.midNightAllOverBlack,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "Locate, Decide, Reach",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      color: visualsColor.midNightAllOverBlack,
                    ),
                  ),
                ),

                const SizedBox(height: 22),
                DesignedTextField(
                  controller: controller.name,
                  image: "assets/designs/mint/mintid.png",
                  hint: "Enter your full name ..",
                ),
                const SizedBox(height: 10),
                DesignedTextField(
                  controller: controller.hospitalname,
                  image: "assets/designs/mint/mintname.png",
                  hint: "Enter hospital name ..",
                ),
                const SizedBox(height: 10),
                DesignedTextField(
                  controller: controller.addresss,
                  image: "assets/designs/mint/mintaddress.png",
                  hint: "Enter hospital address ..",
                ),
                const SizedBox(height: 10),
                DesignedTextField(
                  controller: controller.mno,
                  image: "assets/designs/mint/mintcall.png",
                  hint: "Enter your contact no ..",
                ),
                const SizedBox(height: 10),
                DesignedTextField(
                  controller: controller.email,
                  image: "assets/designs/mint/mintemail.png",
                  hint: "Enter your email id ..",
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    controller.createDoctorAccount();
                  },
                  child: AuthButton(text: "Register"),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.offAll(PatientLoginScreen());
                    },
                    child: const Text(
                      "Login as a Patient",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: visualsColor.mint,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Login as a Doctor",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: visualsColor.mint,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
