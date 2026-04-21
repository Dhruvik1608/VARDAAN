import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/scheme_information.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/scheme_container.dart';
import 'package:vardaan/dashboard/scheme.dart';
import 'package:vardaan/utils/colors.dart';

class SchemeScreen extends StatelessWidget {
  const SchemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: visualsColor.withBarBackground,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 183.h),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const SchemeInformation(
                      image: "assets/emojis/blush.png",
                      index: 0,
                    ),
                  );
                },
                child: SchemeContainer(
                  content: schemesInfo[0]["Objective"]!,
                  title: schemesInfo[0]["Name"]!,
                  image: "assets/emojis/blush.png",
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const SchemeInformation(
                      image: "assets/emojis/blush.png",
                      index: 1,
                    ),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 300),
                    curve: Easing.emphasizedAccelerate,
                  );
                },
                child: SchemeContainer(
                  content: schemesInfo[1]["Objective"]!,
                  title: schemesInfo[1]["Name"]!,
                  image: "assets/emojis/blush.png",
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const SchemeInformation(
                      image: "assets/emojis/blush.png",
                      index: 2,
                    ),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 300),
                    curve: Easing.emphasizedAccelerate,
                  );
                },
                child: SchemeContainer(
                  content: schemesInfo[2]["Objective"]!,
                  title: schemesInfo[2]["Name"]!,
                  image: "assets/emojis/blush.png",
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const SchemeInformation(
                      image: "assets/emojis/blush.png",
                      index: 3,
                    ),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 300),
                    curve: Easing.emphasizedAccelerate,
                  );
                },
                child: SchemeContainer(
                  content: schemesInfo[3]["Objective"]!,
                  title: schemesInfo[3]["Name"]!,
                  image: "assets/emojis/blush.png",
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => SchemeInformation(
                      image: "assets/emojis/blush.png",
                      index: 4,
                    ),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 300),
                    curve: Easing.emphasizedAccelerate,
                  );
                },
                child: SchemeContainer(
                  content: schemesInfo[4]["Objective"]!,
                  title: schemesInfo[4]["Name"]!,
                  image: "assets/emojis/blush.png",
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
