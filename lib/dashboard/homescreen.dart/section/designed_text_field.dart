import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class DesignedTextField extends StatelessWidget {
  final String image;
  final String hint;
  final TextEditingController controller;

  const DesignedTextField({
    super.key,
    required this.controller,
    required this.image,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66.h,
      decoration: BoxDecoration(
        color: visualsColor.mint,
        borderRadius: BorderRadius.circular(33.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.5.h),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 63.w),
            child: Center(
              child: TextField(
                controller: controller,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color(0xff071952),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff071952),
                  ),
                  filled: true,
                  hintText: hint,
                  contentPadding: EdgeInsets.fromLTRB(24.w, 19.h, 35.w, 0.h),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
