import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/utils/colors.dart';

class InfoSmallPerticulerContainer extends StatelessWidget {
  final String title;
  final bool cond;
  final String value1;
  final String value2;
  const InfoSmallPerticulerContainer({
    super.key,
    required this.title,
    required this.cond,
    required this.value1,
    required this.value2,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: cond ? "Father Name: " : "Contact no.: ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffDEEDF3),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: value1,
                                style: const TextStyle(
                                  color: visualsColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: cond ? "Mother Name: " : "Email ID: ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffDEEDF3),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: value2,
                                style: const TextStyle(
                                  color: visualsColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
              image:
                  cond
                      ? "assets/emojis/blush.png"
                      : "assets/emojis/nerdFace.png",
              color2: visualsColor.mintlight,
              color1: visualsColor.mint,
            ),
          ),
        ],
      ),
    );
  }
}
