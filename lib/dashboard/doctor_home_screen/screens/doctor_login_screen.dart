import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/doctor_login_controller.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/home_screen_doctor.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/register_doctor_screen.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/auth_button.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bar_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/designed_text_field.dart';
import 'package:vardaan/utils/colors.dart';

class DoctorLoginScreen extends StatelessWidget {
  DoctorLoginScreen({super.key});
  final DoctorLoginController controller = Get.find<DoctorLoginController>();
  final userData = GetStorage();

  void _login(BuildContext context) async {
    String doctorId = controller.DLogin.text.trim();
    if (doctorId.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter Doctor ID',
        snackPosition: SnackPosition.BOTTOM,
        colorText: visualsColor.white,
        backgroundColor: Colors.grey.shade600,
      );
      return;
    }

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('Doctor')
            .doc(doctorId)
            .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      userData.write("isLoggedD", true);
      userData.write("name", data['name']);
      userData.write("Address", data['address']);
      userData.write("HName", data['hname']);
      userData.write("Id", doctorId);
      userData.write("MNo", data['mno']);
      userData.write("Email", data['email']);

      Get.offAll(
        () => HomeScreenDoctor(),
        transition: Transition.fade,
        duration: Duration(milliseconds: 300),
        curve: Easing.emphasizedAccelerate,
      );
    } else {
      Get.snackbar(
        'Error',
        'Invalid Doctor ID',
        snackPosition: SnackPosition.BOTTOM,
        colorText: visualsColor.white,
        backgroundColor: Colors.grey.shade600,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil().screenHeight;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loginbg (1).png"),
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
                SizedBox(height: 343.h),
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
                      fontWeight: FontWeight.w500,
                      color: visualsColor.midNightAllOverBlack,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                DesignedTextField(
                  controller: controller.DLogin,
                  image: "assets/designs/mint/mintid.png",
                  hint: "Enter your doctor id ..",
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    _login(context);
                    controller.DLogin.clear();
                  },
                  child: AuthButton(text: "Log in"),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
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
                      Get.to(
                        RegisterDoctorScreen(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 300),
                        curve: Easing.emphasizedAccelerate,
                      );
                    },
                    child: const Text(
                      "Register as a Doctor",
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
