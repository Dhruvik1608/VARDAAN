import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bar_container.dart';
import 'package:vardaan/utils/colors.dart';

class AuthBarContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  const AuthBarContainer({
    super.key,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 63.h, 18.w, 0.h),
      child: SizedBox(
        height: 52.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BarContainer(
                width1: 52.w,
                height1: 52.h,
                width2: 43.w,
                height2: 43.h,
                color1: color1,
                color2: color2,
                image: "assets/logos/crossVector.png",
              ),
            ),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "VARDAAN",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      color: visualsColor.midNightAllOverBlack,
                    ),
                  ),
                  Text(
                    " Locate, Decide, Reach.",
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: visualsColor.midNightAllOverBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
