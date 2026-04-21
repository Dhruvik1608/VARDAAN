import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/utils/colors.dart';

class AddPatientContainer extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final validator;
  final bool isAddPatient;
  final String title;
  final String emoji;
  final String hint;
  final onTap;

  const AddPatientContainer({
    super.key,
    required this.controller,

    this.validator,
    required this.title,
    required this.emoji,
    required this.hint,
    required this.readOnly,
    required this.isAddPatient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
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
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: visualsColor.midNightAllOverBlack,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TextFormField(
                  readOnly: readOnly,
                  controller: controller,
                  style: const TextStyle(
                    fontSize: 15,
                    color: visualsColor.withoutBarBackground,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: onTap ?? () {},
                  decoration: InputDecoration(
                    fillColor:
                        isAddPatient ? visualsColor.violet : visualsColor.peach,
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: visualsColor.withoutBarBackground,
                    ),
                    filled: true,
                    hintText: hint,
                    contentPadding: EdgeInsets.fromLTRB(16.w, 19.h, 35.w, 0.h),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                  ),
                  validator: validator,
                ),
              ),
              SizedBox(height: 6.h),
            ],
          ),
          Positioned(
            right: 12.w,
            top: 8.h,
            child: EmojiContainer(
              image: emoji,
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
