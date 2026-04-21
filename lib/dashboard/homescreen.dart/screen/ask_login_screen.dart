import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/patient_login_screen.dart';
import 'package:vardaan/utils/colors.dart';

import '../controller/homescreen_controller.dart';

class AskLoginScreen extends StatelessWidget {
  const AskLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController homescreenController =
        Get.find<HomescreenController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Obx(() {
        return homescreenController.finalLogin.value
            ? Center(
              child: Container(
                width: double.infinity,
                height: 173.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: visualsColor.mintlight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 22),
                    Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 24,
                          color: visualsColor.midNightAllOverBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 1),
                    Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: const Text(
                        "Require Patient ID",
                        style: TextStyle(
                          fontSize: 16,
                          color: visualsColor.midNightAllOverBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w, right: 4.w),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          GestureDetector(
                            onTap: () {
                              homescreenController.finalLogin.value = false;
                            },
                            child: Container(
                              height: 66.h,
                              width: 172.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: Color(0xff6F9AA9).withOpacity(0.6),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 4.w,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: visualsColor.withoutBarBackground,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homescreenController.finalLogin.value = false;

                                  Get.to(
                                    PatientLoginScreen(),

                                    duration: Duration(milliseconds: 400),
                                  );
                                  homescreenController.barIndex.value = 1;
                                },
                                child: Container(
                                  height: 76.h,
                                  width: 180.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.r),
                                    color: visualsColor.mint,
                                    border: Border.all(
                                      color: visualsColor.mintlight,
                                      width: 4.w,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Okay",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            visualsColor.withoutBarBackground,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
            )
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Log in with your Patient ID to",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    color: visualsColor.midNightAllOverBlack,
                  ),
                ),
                const Text(
                  "view your information",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: visualsColor.midNightAllOverBlack,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homescreenController.finalLogin.value = true;
                  },
                  child: const Text(
                    "Log in?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: visualsColor.mint,
                    ),
                  ),
                ),
              ],
            );
      }),
    );
  }
}
