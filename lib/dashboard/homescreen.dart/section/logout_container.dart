import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class LogoutContainer extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  const LogoutContainer({
    super.key,
    required this.title,
    required this.image,
    required this.content,
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
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 89.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: visualsColor.midNightAllOverBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 230.w,
                height: 25.h,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: Text(
                      content,
                      style: const TextStyle(
                        fontSize: 18,
                        color: visualsColor.midNightAllOverBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
