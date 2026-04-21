import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/map_controller.dart';
import 'package:vardaan/utils/colors.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.find<MapController>();
    // final MapController mapController = Get.put(MapController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Container(
        width: double.infinity,
        height: 66.h,
        decoration: BoxDecoration(
          color: visualsColor.mint,
          borderRadius: BorderRadius.circular(33.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.5.h),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/designs/searchbar.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 63.w),
              child: Center(
                child: TextField(
                  controller: mapController.search,
                  onChanged: (value) {
                    mapController.updateNearestHospitals();
                  },
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xff071952),
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff071952),
                    ),
                    filled: true,
                    hintText: "Enter Symptoms Here",
                    contentPadding: EdgeInsets.fromLTRB(24.w, 19.h, 35.w, 0.h),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
