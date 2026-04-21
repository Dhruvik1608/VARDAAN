import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/doctor_search_bar.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/bar_container_section.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/search_bar_section.dart';
import 'package:vardaan/utils/colors.dart';

class AppbarExpanded extends StatelessWidget {
  const AppbarExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController homescreenController =
        Get.find<HomescreenController>();
    const outerAnimationDuration = Duration(milliseconds: 275);
    const innerAnimationDuration = Duration(milliseconds: 250);
    return Obx(() {
      final isSelected =
          homescreenController.isPatient.value
              ? homescreenController.barIndex.value == 1
              : homescreenController.barIndex.value == 0;
      return ClipRect(
        clipBehavior: Clip.none,
        child: AnimatedContainer(
          curve: Curves.easeOut,
          constraints: BoxConstraints(maxHeight: 295.h, minHeight: 160.h),
          clipBehavior: Clip.none,
          height: isSelected ? 295.h : 160.h,
          duration: const Duration(milliseconds: 400),
          width: 392.w + (12.w * 2),
          child: OverflowBox(
            fit: OverflowBoxFit.deferToChild,
            maxWidth: 392.w + (12.w * 2),
            minWidth: 392.w + (12.w * 2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(63.r),
                  bottomLeft: Radius.circular(63.r),
                ),
                border: Border(
                  bottom: BorderSide(
                    width: 12.w,
                    color: visualsColor.midNightAllOverBlack.withOpacity(0.7),
                  ),
                  left: BorderSide(
                    width: 12.w,
                    color: visualsColor.midNightAllOverBlack.withOpacity(0.7),
                  ),
                  right: BorderSide(
                    width: 12.w,
                    color: visualsColor.midNightAllOverBlack.withOpacity(0.7),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    // height: 292.h,
                    width: 392.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(51.r),
                        bottomLeft: Radius.circular(51.r),
                      ),
                      color: visualsColor.midNightAllOverBlack,
                    ),
                    child: ClipRect(
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            left: isSelected ? 45.5.w : 103.5.w,
                            top: isSelected ? 154.h : 72.h,
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 400),
                              child: const Text("VARDAAN"),
                              style: TextStyle(
                                fontSize: isSelected ? 32.sp : 28.sp,
                                fontWeight: FontWeight.bold,
                                color: visualsColor.white,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 400),
                            left: isSelected ? 211.5.w : 109.5.w,
                            top: isSelected ? 158.h : 102.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Locate, Decide, Reach.",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: visualsColor.white,
                                  ),
                                ),
                                isSelected
                                    ? const Text(
                                      "Healthcare Simplified.",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: visualsColor.white,
                                      ),
                                    )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            key: const ValueKey('expanded'),
                            children: [
                              const BarContainerSection(),
                              const Spacer(),

                              // isSelected ? TitleNameSection() : SizedBox.shrink(),
                              // isSelected ? 6.verticalSpace : 0.verticalSpace,
                              // isSelected ? SearchBarSection() : SizedBox.shrink(),
                              FutureBuilder(
                                future: Future.delayed(outerAnimationDuration),
                                builder: (context, snapshot) {
                                  final showInnerContent =
                                      snapshot.connectionState ==
                                      ConnectionState.done;
                                  return AnimatedOpacity(
                                    duration: innerAnimationDuration,
                                    opacity:
                                        showInnerContent && isSelected
                                            ? 1.0
                                            : 0.0,
                                    child:
                                        showInnerContent && isSelected
                                            ? Column(
                                              children: [
                                                6.verticalSpace,
                                                Obx(
                                                  () =>
                                                      homescreenController
                                                              .isPatient
                                                              .value
                                                          ? const SearchBarSection()
                                                          : const DoctorSearchBar(),
                                                ),
                                                15.verticalSpace,
                                              ],
                                            )
                                            : const SizedBox.shrink(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
