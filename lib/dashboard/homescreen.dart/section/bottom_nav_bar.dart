import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bottom_nav_items.dart';
import 'package:vardaan/utils/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController homescreenController =
        Get.find<HomescreenController>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 33.h),
        child: Container(
          height: 66.h,
          decoration: BoxDecoration(
            color: visualsColor.midNightAllOverBlack,
            borderRadius: BorderRadius.circular(33.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => BottomNavItems(
                    icon:
                        homescreenController.isPatient.value
                            ? Icons.document_scanner
                            : Icons.search,
                    indexValue: 0,
                    name:
                        homescreenController.isPatient.value
                            ? "Scheme"
                            : "Find Patient",
                  ),
                ),
                5.horizontalSpace,
                Obx(
                  () => BottomNavItems(
                    icon:
                        homescreenController.isPatient.value
                            ? Icons.map_outlined
                            : Icons.file_present,
                    indexValue: 1,
                    name:
                        homescreenController.isPatient.value
                            ? "Map"
                            : "Add patient",
                  ),
                ),
                5.horizontalSpace,
                Obx(
                  () => BottomNavItems(
                    icon:
                        homescreenController.isPatient.value
                            ? Icons.info_outline
                            : Icons.update,
                    indexValue: 2,
                    name:
                        homescreenController.isPatient.value
                            ? "Info"
                            : "Update Patient",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
