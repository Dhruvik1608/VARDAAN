import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindController extends GetxController {
  final TextEditingController search = TextEditingController();
  RxList<DocumentSnapshot> patients = <DocumentSnapshot>[].obs;

  // RxList man = [
  //   "assets/avatar/man-2.png",
  //   "assets/avatar/man-3.png",
  //   "assets/avatar/man-4.png",
  //   "assets/avatar/man-5.png"
  // ].obs;

  // RxList woman = [
  //   "assets/avatar/woman-2.png",
  //   "assets/avatar/woman-3.png",
  //   "assets/avatar/woman-4.png",
  //   "assets/avatar/woman.png"
  // ].obs;

  RxString searchText = ''.obs;
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    ever(searchText, (_) => _debouncedFetch());
    fetchPatients();
  }

  void updateSearch(String value) {
    searchText.value = value;
  }

  void _debouncedFetch() {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 400), () {
      fetchPatients();
    });
  }

  Future<void> fetchPatients() async {
    try {
      final String searchTerm = search.text.trim();

      QuerySnapshot snapshot;
      if (searchTerm.isEmpty) {
        snapshot = await FirebaseFirestore.instance.collection('Patient').get();
      } else {
        final String searchTermLower = searchTerm.toLowerCase();

        snapshot =
            await FirebaseFirestore.instance
                .collection('Patient')
                .where('Name', isGreaterThanOrEqualTo: searchTermLower)
                .where('Name', isLessThanOrEqualTo: searchTermLower + '\uf8ff')
                .get();
      }

      patients.value = snapshot.docs;
    } catch (e) {
      print('Error fetching patients: $e');
    }
  }
}
