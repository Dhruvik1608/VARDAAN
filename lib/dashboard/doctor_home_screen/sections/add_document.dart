import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/add_patient_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/utils/colors.dart';

class AddDocument extends StatelessWidget {
  final bool isAddPatient;
  const AddDocument({super.key, required this.isAddPatient});

  @override
  Widget build(BuildContext context) {
    final ListController controller = Get.find<ListController>();
    return Container(
      width: 254.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.5.r),
        color:
            isAddPatient ? visualsColor.violetlight : visualsColor.peachlight,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: const Text(
                  "Add Document",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: visualsColor.midNightAllOverBlack,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  height: 75.w,
                  width: 242.w,
                  decoration: BoxDecoration(
                    color:
                        isAddPatient ? visualsColor.violet : visualsColor.peach,
                    borderRadius: BorderRadius.circular(20.5.r),
                  ),
                  child: Center(
                    child: Obx(
                      () => Text(
                        controller.documentFileName.isEmpty
                            ? "Select Document"
                            : controller.documentFileName.toString(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: visualsColor.withoutBarBackground,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
          Positioned(
            right: 12.w,
            top: 8.h,
            child: EmojiContainer(
              image:
                  isAddPatient
                      ? "assets/emojis/openEyes.png"
                      : "assets/emojis/closedEyes.png",
              color2:
                  isAddPatient
                      ? visualsColor.violetlight
                      : visualsColor.peachlight,
              color1: isAddPatient ? visualsColor.violet : visualsColor.peach,
            ),
          ),
        ],
      ),
    );
  }
}
