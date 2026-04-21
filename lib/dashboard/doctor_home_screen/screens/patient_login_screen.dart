import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/Authentications/patient_controllers/patient_login_controller.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/doctor_login_screen.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/auth_button.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/home_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bar_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/designed_text_field.dart';
import 'package:vardaan/utils/colors.dart';

class PatientLoginScreen extends StatelessWidget {
  PatientLoginScreen({super.key});
  final userData = GetStorage();

  final HomescreenController homescreenController = Get.find();

  final PatientLoginController controller = Get.find<PatientLoginController>();

  void _login(BuildContext context) async {
    String patientId = controller.PLogin.text.trim();
    if (patientId.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter Patient ID',
        snackPosition: SnackPosition.BOTTOM,
        colorText: visualsColor.white,
        backgroundColor: Colors.grey.shade600,
      );
      return;
    }

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('Patient')
            .doc(patientId)
            .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      userData.write("isLogged", true);
      userData.write("Name", data['Name']);
      userData.write("Email", data['Email']);
      userData.write("Id", data['ID'].toString());
      userData.write("Age", data['Age']);
      userData.write("Gender", data['Gender']);
      userData.write("FName", data['FName']);
      userData.write("MName", data['MName']);
      userData.write("MNo", data['Mno'].toString());
      userData.write("Consulting", data['Consulting']);
      userData.write("Health", data['Health']);
      userData.write("DocumentFileName", data['DocumentFileName']);
      userData.write("DocumentDownloadURL", data['DocumentDownloadURL']);

      homescreenController.barIndex.value = 1;
      homescreenController.isPatient.value = true;
      Get.offAll(
        () => const HomeScreen(),
        transition: Transition.fade,
        duration: Duration(milliseconds: 300),
        curve: Easing.emphasizedAccelerate,
      );
    } else {
      Get.snackbar(
        'Error',
        'Invalid Patient ID',
        snackPosition: SnackPosition.BOTTOM,
        colorText: visualsColor.white,
        backgroundColor: Colors.grey.shade600,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("patient login screen builded");
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
                    homescreenController.isPatient.value = true;
                    Get.offAll(
                      () => const HomeScreen(),
                      duration: Duration(milliseconds: 400),
                    );
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
                SizedBox(height: 374.h),
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
                  controller: controller.PLogin,
                  image: "assets/designs/mint/mintid.png",
                  hint: "Enter your patient id ..",
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    _login(context);
                    controller.PLogin.clear();
                  },
                  child: const AuthButton(text: "Log in"),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        DoctorLoginScreen(),
                        transition: Transition.cupertino,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInSine,
                      );
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
