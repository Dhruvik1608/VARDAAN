import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class SchemeContainer extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  const SchemeContainer({
    super.key,
    required this.content,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: visualsColor.peachlight,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 22.w, top: 11.h),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: visualsColor.peach,
                borderRadius: BorderRadius.circular(24.r),
              ),
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
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
