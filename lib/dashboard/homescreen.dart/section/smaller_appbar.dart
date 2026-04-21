import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/auth_bar_container.dart';
import 'package:vardaan/utils/colors.dart';

class SmallerAppbar extends StatelessWidget {
  final Color color1;
  final Color color2;
  const SmallerAppbar({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: OverflowBox(
        maxWidth: 392.w + (12.w * 2),
        minWidth: 392.w + (12.w * 2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(63.r),
              bottomLeft: Radius.circular(63.r),
            ),
            border: Border(
              bottom: BorderSide(
                width: 12.w,
                color: visualsColor.white.withOpacity(0.5),
              ),
              left: BorderSide(
                width: 12.w,
                color: visualsColor.white.withOpacity(0.5),
              ),
              right: BorderSide(
                width: 12.w,
                color: visualsColor.white.withOpacity(0.5),
              ),
            ),
          ),
          child: Container(
            width: 392.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(51.r),
                bottomLeft: Radius.circular(51.r),
              ),
              color: visualsColor.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AuthBarContainer(color1: color1, color2: color2),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
