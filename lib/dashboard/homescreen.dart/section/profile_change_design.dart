import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class ProfileChangeDesign extends StatelessWidget {
  const ProfileChangeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 140.h,

        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundColor: visualsColor.violet,
              child: Container(
                height: 112.8.h,
                width: 112.8.w,
                decoration: BoxDecoration(
                  color: visualsColor.violetlight,
                  image: DecorationImage(
                    image: AssetImage("assets/images/defaultDP.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: visualsColor.white, width: 4.w),
                ),
              ),
            ),
            Positioned(
              top: 104.5.h,
              child: Container(
                height: 36.h,
                decoration: BoxDecoration(
                  color: visualsColor.withoutBarBackground,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(width: 2.w, color: visualsColor.violet),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 13.r,
                        child: Center(child: Icon(Icons.edit, size: 15.sp)),
                        backgroundColor: visualsColor.violetlight,
                      ),
                      4.horizontalSpace,
                      const Text(
                        "Edit Picture ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: visualsColor.midNightAllOverBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
