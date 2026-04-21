import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class ButtonSection extends StatelessWidget {
  final onSubmit;
  final onClear;
  final bool isAddPatient;
  const ButtonSection({
    super.key,
    required this.isAddPatient,
    required this.onClear,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        GestureDetector(
          onTap: onClear,
          child: Container(
            height: 68.h,
            width: 172.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color:
                  isAddPatient
                      ? visualsColor.violetlight
                      : visualsColor.peachlight,
              border: Border.all(color: Colors.transparent, width: 4.w),
            ),
            child: const Center(
              child: Text(
                "Clear",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: visualsColor.withoutBarBackground,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: onSubmit,
              child: Container(
                height: 72.h,
                width: 185.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color:
                      isAddPatient ? visualsColor.violet : visualsColor.peach,
                  border: Border.all(
                    color:
                        isAddPatient
                            ? visualsColor.violetlight
                            : visualsColor.peachlight,
                    width: 4.w,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: visualsColor.withoutBarBackground,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
