import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class EmojiContainer extends StatelessWidget {
  final String image;
  final Color? color1;
  final Color? color2;
  const EmojiContainer({
    super.key,
    required this.image,
    this.color1,
    this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37.w,
      height: 37.h,
      decoration: BoxDecoration(
        color: color2 ?? visualsColor.peachlight,
        borderRadius: BorderRadius.circular(18.5.r),
        border: Border.all(color: color1 ?? visualsColor.peach, width: 5.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image.asset(image),
      ),
    );
  }
}
