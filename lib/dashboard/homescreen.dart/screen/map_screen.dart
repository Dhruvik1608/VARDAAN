import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/carosel_section.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/map_section.dart';
import 'package:vardaan/utils/colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: visualsColor.white,

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapSection(),
          Positioned(top: 602.h, child: CaroselSection()),
        ],
      ),
    );
  }
}
