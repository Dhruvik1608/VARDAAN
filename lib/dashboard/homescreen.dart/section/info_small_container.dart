import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/utils/colors.dart';

class InfoSmallContainer extends StatelessWidget {
  final String emoji;
  final String title;
  final String consultant;
  const InfoSmallContainer({
    super.key,
    required this.title,
    required this.emoji,
    required this.consultant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: visualsColor.mintlight,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: visualsColor.midNightAllOverBlack,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: visualsColor.mint,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 11.h),
                    child: Text(
                      consultant,
                      style: const TextStyle(
                        fontSize: 16,
                        color: visualsColor.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
          Positioned(
            right: 12.w,
            top: 8.h,
            child: EmojiContainer(
              image: emoji,
              color2: visualsColor.mintlight,
              color1: visualsColor.mint,
            ),
          ),
        ],
      ),
    );
  }
}
