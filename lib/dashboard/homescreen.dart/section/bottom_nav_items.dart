import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/utils/colors.dart';

class BottomNavItems extends StatelessWidget {
  final int indexValue;
  final String name;
  final IconData icon;

  const BottomNavItems({
    super.key,
    required this.indexValue,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final HomescreenController homescreenController =
        Get.find<HomescreenController>();
    return InkWell(
      onTap: () {
        homescreenController.barIndex.value = indexValue;
      },
      child: Obx(() {
        final index = homescreenController.barIndex.value;
        return ClipRRect(
          borderRadius: BorderRadius.circular(23.r),
          child: AnimatedSize(
            duration: Duration(milliseconds: 400),
            child: Container(
              height: 46.h,
              width: index == indexValue ? null : 46.w,
              decoration: BoxDecoration(
                color:
                    index == indexValue
                        ? visualsColor.withBarBackground
                        : visualsColor.blackNavBar,
                borderRadius: BorderRadius.circular(23.r),
              ),
              child:
                  index == indexValue
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          18.horizontalSpace,
                          Icon(icon, size: 20.sp),
                          12.horizontalSpace,
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          18.horizontalSpace,
                        ],
                      )
                      : Icon(
                        icon,
                        size: 22,
                        color: visualsColor.withBarBackground,
                      ),
            ),
          ),
        );
      }),
    );
  }
}
