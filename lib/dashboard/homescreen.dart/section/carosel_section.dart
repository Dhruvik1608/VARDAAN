import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/map_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/screen/hospital_information_screen.dart';
import 'package:vardaan/utils/colors.dart';

class CaroselSection extends StatelessWidget {
  const CaroselSection({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.find<MapController>();

    double screenWidth = ScreenUtil().screenWidth;
    final List<Color> colorslight = [
      visualsColor.mintlight,
      visualsColor.violetlight,
      visualsColor.peachlight,
    ];
    final List<Color> colors = [
      visualsColor.mint,
      visualsColor.violet,
      visualsColor.peach,
    ];
    return SizedBox(
      height: 138.h,
      width: screenWidth,
      child: Obx(
        () => CarouselSlider.builder(
          itemCount: controller.nearestHospitalLocations.length,
          itemBuilder: (context, itemindex, _) {
            if (itemindex >= 0 &&
                itemindex < controller.nearestHospitalNames.length) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => HospitalInformationScreen(
                      color1: colors[itemindex],
                      color2: colorslight[itemindex],
                      index: itemindex,
                    ),
                  );
                },
                child: Container(
                  width: 300.w,
                  height: 138.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: colorslight[itemindex],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 21.w, top: 2.h),
                            child: SizedBox(
                              height: 36.h,
                              width: 180.w,

                              child: Text(
                                softWrap: true,
                                controller.nearestHospitalNames.length >
                                        itemindex
                                    ? controller.nearestHospitalNames[itemindex]
                                    : "N/A",
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                  color: visualsColor.midNightAllOverBlack,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 1.h, right: 12.w),
                            child: Container(
                              alignment: Alignment.centerRight,
                              height: 42.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(37.r),
                                color: colors[itemindex],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.launchDialer(
                                          controller
                                              .nearestHospitalDetails[itemindex]["Call"],
                                        );
                                      },
                                      child: const CircleAvatar(
                                        radius: 16,
                                        backgroundColor: visualsColor.white,
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.phone,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    3.horizontalSpace,
                                    InkWell(
                                      onTap: () {
                                        (controller.launchUrlString(
                                          controller
                                              .nearestHospitalDetails[itemindex]["Link"],
                                        ));
                                      },
                                      child: const CircleAvatar(
                                        radius: 16,
                                        backgroundColor: visualsColor.white,
                                        child: Center(
                                          child: Text(
                                            "GO",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  visualsColor
                                                      .midNightAllOverBlack,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 2.h),
                            child: Container(
                              height: 85.h,
                              width: 208.w,
                              decoration: BoxDecoration(
                                color: colors[itemindex],
                                border: Border(
                                  top: BorderSide(
                                    color: colorslight[itemindex],
                                    width: 4.w,
                                  ),
                                  left: BorderSide(
                                    color: colorslight[itemindex],
                                    width: 4.w,
                                  ),
                                  bottom: BorderSide(
                                    color: colorslight[itemindex],
                                    width: 4.w,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Center(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                      vertical: 3.h,
                                    ),
                                    child: Text(
                                      controller
                                                  .nearestHospitalDetails
                                                  .isNotEmpty &&
                                              controller
                                                      .nearestHospitalDetails
                                                      .length >
                                                  itemindex &&
                                              controller
                                                  .nearestHospitalDetails[itemindex]
                                                  .containsKey('Address')
                                          ? controller
                                              .nearestHospitalDetails[itemindex]['Address']
                                          : "Address not available",
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: visualsColor.white,
                                        height: 1.1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                Container(
                                  height: 85.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: colors[itemindex],
                                    border: Border.all(
                                      color: colorslight[itemindex],
                                      width: 4.w,
                                    ),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 75.w,
                                          height: 40.h,

                                          child: Center(
                                            child: FittedBox(
                                              child: Text(
                                                controller
                                                            .nearestHospitalDistances
                                                            .length >
                                                        itemindex
                                                    ? controller
                                                        .nearestHospitalDistances[itemindex]
                                                        .toStringAsFixed(2)
                                                    : "N/A",
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  color: visualsColor.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 2.h),
                                          child: Text(
                                            "km",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: colorslight[itemindex],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 4),

            enableInfiniteScroll: true,

            onPageChanged: (index, _) {
              controller.focusOnSelectedHospital(index);
            },
          ),
        ),
      ),
    );
  }
}
