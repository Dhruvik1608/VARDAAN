import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/utils/colors.dart';

class NameExpandableContainer extends StatelessWidget {
  // final String? image;

  const NameExpandableContainer({
    super.key,

    // required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final userData = GetStorage();
    final HomescreenController homescreenController =
        Get.find<HomescreenController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(33.r),
      child: AnimatedSize(
        duration: Duration(milliseconds: 400),
        child: Obx(
          () => Container(
            height: 66.h,
            decoration: BoxDecoration(
              color:
                  homescreenController.expandableBarColor2() ??
                  visualsColor.mintlight,
              border: Border.all(
                color:
                    homescreenController.expandableBarColor() ??
                    visualsColor.mint,
                width: 4.5.w,
              ),
              borderRadius: BorderRadius.circular(33.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 5.5.w, right: 7.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage("assets/images/defaultDP.png"),
                    backgroundColor: visualsColor.mint,
                  ),
                  const SizedBox(width: 5),
                  Obx(() {
                    String displayText = "❤️";
                    print(
                      "Doctor value:" + userData.read("isLoggedD").toString(),
                    );
                    print(
                      "Patient value:" + userData.read("isLogged").toString(),
                    );
                    print(
                      "index is:" +
                          homescreenController.barIndex.value.toString(),
                    );

                    if (userData.read('isLoggedD') == true &&
                        homescreenController.barIndex.value == 0) {
                      print("doctor called");
                      displayText =
                          "Hi ${userData.read("name").toString().split(" ").first} 👋🏻";
                    } else if (homescreenController.barIndex.value == 1 &&
                        userData.read('isLogged') == true) {
                      print("patient called");
                      displayText =
                          "Hi ${userData.read("Name").toString().split(" ").first} 👋🏻";
                    }

                    return AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 400),
                      style: const TextStyle(
                        fontSize: 18,
                        color: visualsColor.midNightAllOverBlack,
                        fontFamily: "Label",
                        fontWeight: FontWeight.w600,
                      ),
                      child: Text(
                        displayText,
                        style: const TextStyle(fontSize: 15),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
