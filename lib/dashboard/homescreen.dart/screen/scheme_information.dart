import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/hospital_information_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/scheme_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/scheme_information_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/smaller_appbar.dart';
import 'package:vardaan/utils/colors.dart';

class SchemeInformation extends StatelessWidget {
  final int index;
  final String image;

  const SchemeInformation({
    super.key,
    required this.image,
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
                  SchemeInformationContainer(image: image, index: index),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          SmallerAppbar(
            color1: visualsColor.peach,
            color2: visualsColor.peachlight,
          ),
        ],
      ),
    );
  }
}
