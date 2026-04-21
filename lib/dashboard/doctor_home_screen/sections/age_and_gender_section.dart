import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/add_patient_controller.dart';
import 'package:vardaan/utils/colors.dart';

class AgeAndGenderSection extends StatelessWidget {
  const AgeAndGenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ListController controller = Get.find<ListController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 84.w,
          decoration: BoxDecoration(
            color: visualsColor.violetlight,
            borderRadius: BorderRadius.circular(26.5.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Age",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: visualsColor.midNightAllOverBlack,
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.w),
                child: Container(
                  width: double.infinity,
                  height: 72.h,
                  decoration: BoxDecoration(
                    color: visualsColor.violet,
                    borderRadius: BorderRadius.circular(20.5.r),
                  ),
                  child: Center(
                    child: Obx(
                      () => Text(
                        controller.age.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: visualsColor.withoutBarBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: visualsColor.violetlight,
            borderRadius: BorderRadius.circular(26.5.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: const Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: visualsColor.midNightAllOverBlack,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 6.w),
                child: Row(
                  children: [
                    Container(
                      height: 72.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: visualsColor.violet,
                        borderRadius: BorderRadius.circular(20.5.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            child: Obx(
                              () => Radio(
                                value: "Male",
                                groupValue: controller.selectedGender.value,
                                onChanged: (String? value) {
                                  controller.setSelectedGender(value!);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      height: 72.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: visualsColor.violet,
                        borderRadius: BorderRadius.circular(20.5.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            child: Obx(
                              () => Radio(
                                value: "Female",
                                groupValue: controller.selectedGender.value,
                                onChanged: (String? value) {
                                  controller.setSelectedGender(value!);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                    6.horizontalSpace,
                    Container(
                      height: 72.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: visualsColor.violet,
                        borderRadius: BorderRadius.circular(20.5.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            child: Obx(
                              () => Radio(
                                value: "Other",
                                groupValue: controller.selectedGender.value,
                                onChanged: (String? value) {
                                  controller.setSelectedGender(value!);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Other",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
