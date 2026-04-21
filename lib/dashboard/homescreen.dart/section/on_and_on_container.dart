import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/utils/colors.dart';

class OnAndOnContainer extends StatelessWidget {
  final String id;
  final String name;
  final String gender;
  final String age;
  final String title;
  final String emoji;
  const OnAndOnContainer({
    super.key,
    required this.emoji,
    required this.title,
    required this.id,
    required this.age,
    required this.gender,
    required this.name,
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

              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Container(
                          height: 101.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                            color: visualsColor.mint,
                            border: Border(
                              top: BorderSide(
                                color: visualsColor.mintlight,
                                width: 4.w,
                              ),
                              right: BorderSide(
                                color: visualsColor.mintlight,
                                width: 4.w,
                              ),
                              bottom: BorderSide(
                                color: visualsColor.mintlight,
                                width: 4.w,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(21.w, 0, 5.w, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Patient ID: ",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          height: 1,
                                          color: Color(0xffDEEDF3),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: id,
                                        style: TextStyle(
                                          color: visualsColor.white,
                                          fontSize: 16.sp,
                                          height: 1,
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
                                        text: "Name: ",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          height: 1,
                                          color: Color(0xffDEEDF3),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: name,
                                        style: TextStyle(
                                          color: visualsColor.white,
                                          fontSize: 16.sp,
                                          height: 1,
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
                                        text: "Gender: ",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          height: 1,
                                          color: Color(0xffDEEDF3),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: gender,
                                        style: TextStyle(
                                          color: visualsColor.white,
                                          fontSize: 16.sp,
                                          height: 1,
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
                                        text: "Age: ",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          height: 1,
                                          color: Color(0xffDEEDF3),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: age.toString(),
                                        style: TextStyle(
                                          color: visualsColor.white,
                                          fontSize: 16.sp,
                                          height: 1,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 2.h),
                    child: Container(
                      height: 101.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: visualsColor.mint,
                        image: DecorationImage(
                          image: AssetImage("assets/images/defaultDP.png"),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: visualsColor.mintlight,
                          width: 4.w,
                        ),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ],
              ),
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
