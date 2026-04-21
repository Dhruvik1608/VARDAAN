import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class SchemeSmallContainer extends StatelessWidget {
  final String content;
  final Color color1;
  const SchemeSmallContainer({
    super.key,
    required this.content,
    required this.color1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 11.h),
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              color: visualsColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
    );
  }
}
