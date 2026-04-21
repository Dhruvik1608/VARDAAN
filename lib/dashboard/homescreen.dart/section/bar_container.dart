import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class BarContainer extends StatelessWidget {
  final Color? color1;
  final Color? color2;
  final double? height1;
  final double? height2;
  final String image;
  final double? width1;
  final double? width2;
  const BarContainer({
    super.key,
    required this.image,
    required this.width1,
    required this.width2,
    this.color1,
    this.color2,
    this.height1,
    this.height2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height1 ?? 66.h,
      width: width1,
      decoration: BoxDecoration(
        color: color1 ?? visualsColor.mint,
        borderRadius: BorderRadius.circular(33.r),
      ),
      child: Center(
        child: Container(
          width: width2,
          height: height2 ?? 57.h,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(image),
            ),
          ),
          decoration: BoxDecoration(
            color: color2 ?? visualsColor.mintlight,
            borderRadius: BorderRadius.circular(33.r),
          ),
        ),
      ),
    );
  }
}
