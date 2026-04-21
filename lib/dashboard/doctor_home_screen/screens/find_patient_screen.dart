import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/search_patient_controller.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/find_patient_information.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/utils/colors.dart';

class FindPatientScreen extends StatelessWidget {
  const FindPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenUtil().screenHeight;
    print(screenHeight);
    final FindController _findController = Get.find<FindController>();
    Future<void> _refreshPatients() async {
      await _findController.fetchPatients();
    }

    return Container(
      color: visualsColor.withBarBackground,
      child: Obx(
        () => RefreshIndicator(
          onRefresh: _refreshPatients,
          child:
              _findController.patients.isEmpty
                  ? const Center(
                    child: Text(
                      "No patients found",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                  : ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                      24.w,
                      screenHeight > 910 ? 340.h : 320.h,
                      24.w,
                      110.h,
                    ),
                    itemCount: _findController.patients.length,
                    itemBuilder: (context, index) {
                      final patient = _findController.patients[index];
                      final id = patient.id;
                      final name = patient['Name'].toString().toLowerCase();
                      final age = patient['Age'];
                      final gender = patient['Gender'];
                      final FName = patient['FName'];
                      final MName = patient['MName'];
                      final MNo = patient['Mno'];
                      final Email = patient['Email'];
                      final consultant = patient['Consulting'];
                      final Health = patient['Health'];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0.h),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              FindPatientInformation(
                                id: id,
                                name: name,
                                age: age,
                                gender: gender,
                                fname: FName,
                                mname: MName,
                                mno: MNo,
                                email: Email,
                                consultant: consultant,
                                health: Health,
                              ),
                              transition: Transition.fade,
                              duration: Duration(milliseconds: 300),
                              curve: Easing.emphasizedAccelerate,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: visualsColor.mintlight,
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.only(left: 22.w),
                                      child: const Text(
                                        "Patient Information",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              visualsColor.midNightAllOverBlack,
                                        ),
                                      ),
                                    ),

                                    Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                            2.w,
                                            0,
                                            2.w,
                                            2.h,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Spacer(),
                                              Container(
                                                height: 101.h,
                                                width: 250.w,
                                                decoration: BoxDecoration(
                                                  color: visualsColor.mint,
                                                  border: Border(
                                                    top: BorderSide(
                                                      color:
                                                          visualsColor
                                                              .mintlight,
                                                      width: 4.w,
                                                    ),
                                                    right: BorderSide(
                                                      color:
                                                          visualsColor
                                                              .mintlight,
                                                      width: 4.w,
                                                    ),
                                                    bottom: BorderSide(
                                                      color:
                                                          visualsColor
                                                              .mintlight,
                                                      width: 4.w,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        30.r,
                                                      ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                    21.w,
                                                    0,
                                                    5.w,
                                                    0,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  "Patient ID: ",
                                                              style: TextStyle(
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                color: Color(
                                                                  0xffDEEDF3,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: id,
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xffffffff,
                                                                ),
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "Name: ",
                                                              style: TextStyle(
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                color: Color(
                                                                  0xffDEEDF3,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: name,
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xffffffff,
                                                                ),
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "Gender: ",
                                                              style: TextStyle(
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                color: Color(
                                                                  0xffDEEDF3,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  gender
                                                                      .toString(),
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xffffffff,
                                                                ),
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "Age: ",
                                                              style: TextStyle(
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                color: Color(
                                                                  0xffDEEDF3,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  age.toString(),
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xffffffff,
                                                                ),
                                                                fontSize: 16.sp,
                                                                height: 1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                            2.w,
                                            0,
                                            2.w,
                                            2.h,
                                          ),
                                          child: Container(
                                            height: 101.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/defaultDP.png",
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                              color: visualsColor.mint,
                                              border: Border.all(
                                                color: visualsColor.mintlight,
                                                width: 4.w,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 12.w,
                                  top: 8.h,
                                  child: EmojiContainer(
                                    image: "assets/emojis/blush.png",
                                    color2: visualsColor.mintlight,
                                    color1: visualsColor.mint,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
