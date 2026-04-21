import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/scheme_small_container.dart';
import 'package:vardaan/dashboard/scheme.dart';
import 'package:vardaan/utils/colors.dart';

class SchemeInformationContainer extends StatelessWidget {
  final int index;

  final String image;
  const SchemeInformationContainer({
    super.key,

    required this.index,
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 11.h, 22.w, 8.h),
                child: const Text(
                  "Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              SchemeSmallContainer(
                content: schemesInfo[index]["Name"]!,
                color1: visualsColor.peach,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Objective",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              SchemeSmallContainer(
                content: schemesInfo[index]['Objective']!,
                color1: visualsColor.peach,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Benefits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              SchemeSmallContainer(
                color1: visualsColor.peach,
                content: schemesInfo[index]['Benefits']!,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Eligibility",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              SchemeSmallContainer(
                content: schemesInfo[index]['Eligibility']!,
                color1: visualsColor.peach,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Documents",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              SchemeSmallContainer(
                content: schemesInfo[index]['Documents']!,
                color1: visualsColor.peach,
              ),

              const SizedBox(height: 8),
            ],
          ),
          Positioned(
            right: 12.w,
            top: 16.h,
            child: EmojiContainer(
              image: image,
              color1: visualsColor.peach,
              color2: visualsColor.peachlight,
            ),
          ),
        ],
      ),
    );
  }
}
