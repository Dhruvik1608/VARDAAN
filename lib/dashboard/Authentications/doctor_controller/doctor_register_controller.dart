import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/home_screen_doctor.dart';
import 'package:vardaan/utils/colors.dart';

class DoctorCreateController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController mno = TextEditingController();
  final TextEditingController addresss = TextEditingController();
  final TextEditingController hospitalname = TextEditingController();
  final userData = GetStorage();

  void clearTextControllers() {
    email.clear();
    name.clear();
    mno.clear();
    addresss.clear();
    hospitalname.clear();
  }

  String generateUniqueID() {
    const _chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const _idLength = 5;
    final _rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        _idLength,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
  }

  void createDoctorAccount() async {
    if (name.text.isEmpty ||
        hospitalname.text.isEmpty ||
        addresss.text.isEmpty ||
        mno.text.isEmpty ||
        email.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all details',
        snackPosition: SnackPosition.BOTTOM,
        colorText: visualsColor.white,
        backgroundColor: Colors.grey.shade600,
      );
      return;
    }

    await Firebase.initializeApp();

    try {
      String docId = generateUniqueID();

      await FirebaseFirestore.instance.collection('Doctor').doc(docId).set({
        'name': name.text,
        'hname': hospitalname.text,
        'address': addresss.text,
        'mno': mno.text,
        'email': email.text,
      });

      Get.snackbar(
        'Success',
        'Account created successfully',
        snackPosition: SnackPosition.BOTTOM,
        colorText: visualsColor.white,
        backgroundColor: Colors.grey.shade600,
      );

      userData.write("isLoggedD", true);
      userData.write("name", name.text);
      userData.write("HName", hospitalname.text);
      userData.write("Id", docId.toString());
      userData.write("MNo", mno.text);
      userData.write("Email", email.text);

      // Pass details to Code 2 (DoctorHome) and navigate there
      Get.offAll(
        () => HomeScreenDoctor(),
        transition: Transition.fade,
        duration: Duration(milliseconds: 300),
        curve: Easing.emphasizedAccelerate,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to create account. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: visualsColor.white,
        backgroundColor: Colors.grey.shade600,
      );
    }
  }
}
