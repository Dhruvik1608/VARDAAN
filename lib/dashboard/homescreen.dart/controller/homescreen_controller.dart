import 'dart:ui';

import 'package:get/get.dart';
import 'package:vardaan/utils/colors.dart';

class HomescreenController extends GetxController {
  RxInt barIndex = 1.obs;
  RxBool isPatient = false.obs;

  RxBool finalLogin = false.obs;

  Color? expandableBarColor() {
    if (isPatient.value) {
      if (barIndex == 0) {
        return visualsColor.peach;
      } else {
        return null;
      }
    } else {
      if (barIndex == 1) {
        return visualsColor.violet;
      } else if (barIndex == 2) {
        return visualsColor.peach;
      } else {
        return null;
      }
    }
  }

  Color? expandableBarColor2() {
    if (isPatient.value) {
      if (barIndex == 0) {
        return visualsColor.peachlight;
      } else {
        return null;
      }
    } else {
      if (barIndex == 1) {
        return visualsColor.violetlight;
      } else if (barIndex == 2) {
        return visualsColor.peachlight;
      } else {
        return null;
      }
    }
  }
}
