import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/map_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/scheme_small_container.dart';

class HospitalInformationContainer extends StatelessWidget {
  final int index;
  final Color color1;
  final Color color2;
  const HospitalInformationContainer({
    super.key,
    required this.color1,
    required this.color2,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.find<MapController>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color2,
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
                  "Name:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => SchemeSmallContainer(
                  content: controller.nearestHospitalNames[index],
                  color1: color1,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Address:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => SchemeSmallContainer(
                  content: controller.nearestHospitalDetails[index]['Address'],
                  color1: color1,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Call:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => SchemeSmallContainer(
                  color1: color1,
                  content: controller.nearestHospitalDetails[index]['Call'],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Treatment:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => SchemeSmallContainer(
                  content:
                      controller.nearestHospitalDetails[index]['Treatment'],
                  color1: color1,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Facility:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => SchemeSmallContainer(
                  content: controller.nearestHospitalDetails[index]['Facility'],
                  color1: color1,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 8.h),
                child: const Text(
                  "Scheme:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => SchemeSmallContainer(
                  content: controller.nearestHospitalDetails[index]['Scheme'],
                  color1: color1,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
          Positioned(
            right: 12.w,
            top: 16.h,
            child: EmojiContainer(
              image: "assets/emojis/blush.png",
              color1: color1,
              color2: color2,
            ),
          ),
        ],
      ),
    );
  }
}
