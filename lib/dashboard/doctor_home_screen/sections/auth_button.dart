import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  const AuthButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33.r),
        color: visualsColor.midNightAllOverBlack,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: visualsColor.white,
          ),
        ),
      ),
    );
  }
}
