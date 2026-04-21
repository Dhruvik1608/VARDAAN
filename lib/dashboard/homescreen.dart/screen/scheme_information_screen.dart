import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/hospital_information_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/smaller_appbar.dart';

class SchemeInformationScreen extends StatelessWidget {
  final int index;
  final Color color1;
  final Color color2;
  const SchemeInformationScreen({
    super.key,
    required this.color1,
    required this.color2,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 171.h),
                  HospitalInformationContainer(
                    index: index,
                    color1: color1,
                    color2: color2,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          SmallerAppbar(color1: color1, color2: color2),
        ],
      ),
    );
  }
}
