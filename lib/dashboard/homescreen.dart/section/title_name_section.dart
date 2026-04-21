import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/utils/colors.dart';

class TitleNameSection extends StatelessWidget {
  const TitleNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "VARDAAN",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: visualsColor.white,
          ),
        ),
        10.horizontalSpace,
        Column(
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
            const Text(
              "Healthcare Simplified.",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: visualsColor.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
