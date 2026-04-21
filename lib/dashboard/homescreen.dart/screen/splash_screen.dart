import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/home_screen_doctor.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/patient_login_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/home_screen.dart';
import 'package:vardaan/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final HomescreenController homescreenController =
      Get.find<HomescreenController>();
  final userData = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (userData.read('isLogged') == true) {
        homescreenController.isPatient.value = true;
        Get.offAll(() => const HomeScreen());
      } else if (userData.read('isLoggedD') == true) {
        Get.offAll(() => const HomeScreenDoctor());
      } else {
        Get.offAll(() => PatientLoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil().screenHeight;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splashScreenBG.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 126.h,
              width: 126.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: visualsColor.mintlight,
                border: Border.all(color: visualsColor.mint, width: 10.w),
              ),
              child: Center(
                child: SizedBox(
                  height: 74.h,
                  width: 74.w,
                  child: Image.asset("assets/logos/vardaanLogoCompressed.png"),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "VARDAAN",
              style: TextStyle(
                fontSize: 46,

                fontWeight: FontWeight.bold,
                color: Color(0xff415E66),
              ),
            ),
            const Text(
              "Locate, Decide, Reach",
              style: TextStyle(
                fontSize: 19,
                height: 1.1,
                fontWeight: FontWeight.w500,
                color: Color(0xff415E66),
              ),
            ),
            const Text(
              "Healthcare Simplified",
              style: TextStyle(
                fontSize: 19,
                height: 1.1,
                fontWeight: FontWeight.w500,
                color: Color(0xff415E66),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
